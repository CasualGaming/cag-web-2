
## Build stage
FROM ubuntu:bionic AS build

ENV BUILD_DIR="/src"
ENV WEB_DIR="/web"
ENV HUGO_RELEASE="0.81.0"
ENV HUGO_DEB_FILE="https://github.com/gohugoio/hugo/releases/download/v${HUGO_RELEASE}/hugo_${HUGO_RELEASE}_Linux-64bit.deb"

WORKDIR "$BUILD_DIR"

# Install hugo
RUN \
apt-get -qq update \
&& apt-get -qq install -y wget \
&& wget --quiet "$HUGO_DEB_FILE" -O /tmp/hugo.deb \
&& dpkg -i /tmp/hugo.deb

# Add site source
COPY config.toml ./
COPY themes/ themes/
COPY content/ content/
COPY layouts/ layouts/
COPY static/ static/
COPY i18n/ i18n/

# Build site
RUN \
hugo -v --minify -s . -d "$WEB_DIR" \
&& echo "Output size: $(du -sh ${WEB_DIR})"

## Runtime stage
FROM nginx:1-alpine

ENV WEB_DIR="/web"
ENV NGINX_WEB_DIR="/usr/share/nginx/html"

# Add webdir from build stage
COPY --from=build $WEB_DIR $WEB_DIR
RUN chown -R nginx:nginx $WEB_DIR

# nginx site config
RUN echo \
$'server {\n\
    listen 80;\n\
    server_name localhost;\n\
    location / {\n\
        root   /web;\n\
        index  index.html;\n\
    }\n\
    error_page 404 = /404.html;\n\
    absolute_redirect off;\n\
}' > /etc/nginx/conf.d/default.conf

# Expose HTTP port
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

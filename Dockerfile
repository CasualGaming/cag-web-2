
## Build stage
FROM ubuntu:bionic AS build

ENV BUILD_DIR=/src
ENV WEB_DIR=/web
ENV HUGO_RELEASE=0.63.2
ENV HUGO_DEB_FILE=https://github.com/gohugoio/hugo/releases/download/v${HUGO_RELEASE}/hugo_${HUGO_RELEASE}_Linux-64bit.deb

WORKDIR $BUILD_DIR

# Import everything
COPY . .

# Install hugo
RUN apt-get -qq update
RUN apt-get -qq install -y wget
RUN wget --quiet $HUGO_DEB_FILE -O /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb

# Build site
RUN hugo -v --minify -s . -d $WEB_DIR
RUN echo "Output size: $(du -sh ${WEB_DIR})"

## Final stage
FROM nginx:1-alpine

ENV BUILD_DIR=/src
ENV WEB_DIR=/web
ENV NGINX_WEB_DIR=/usr/share/nginx/html

# Import and chown webdir from build stage
COPY --from=build $WEB_DIR $WEB_DIR
RUN chown -R nginx:nginx $WEB_DIR

# nginx server config
RUN echo $'server {\n\
    listen 80;\n\
    server_name localhost;\n\
    location / {\n\
        root   /web;\n\
        index  index.html;\n\
    }\n\
    error_page 404 = /404.html;\n\
    absolute_redirect off;\n\
}' > /etc/nginx/conf.d/default.conf

# HTTP port
EXPOSE 80

# Run in foreground
CMD ["nginx", "-g", "daemon off;"]

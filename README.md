# Casual Gaming Website

[![Build Status](https://travis-ci.com/CasualGaming/cag-web.svg?branch=master)](https://travis-ci.com/CasualGaming/cag-web)

Static Hugo website build by Travis CI and served by GitHub Pages.

* Theme: [CasualGaming/fifty](https://github.com/CasualGaming/fifty)
* Generated site: [CasualGaming/casualgaming.github.io](https://github.com/CasualGaming/casualgaming.github.io)

## Online Editing
Simple content changes and such can be easily changed directly wrong GitHub.
When the file is saved/committed, the site is automatically rebuilt and redeployed.
Make sure the automatic build succeeds and that the site is working after the deployment has finished (at most 5 minutes after committing).

## Desktop Editing

* Run `./update-submodules.sh` (or `make update-submodules`) to clone the required submodules. This is required when the repo was just cloned or any submodules were updated.
* Run `./run-server.sh` (or `make server`) to start a development server with hot reloading.

## Tips
* The favicons were generated using [Favicon Generator. For real.](https://realfavicongenerator.net/)
* Images can be compressed (esp. JPEGs), for instance with <https://compressjpeg.com/> at 75% quality.

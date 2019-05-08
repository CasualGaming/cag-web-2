# CaG Web II

[![Build Status](https://travis-ci.com/CasualGaming/cag-web-2.svg?branch=master)](https://travis-ci.com/CasualGaming/cag-web-2)
![Source size](https://img.shields.io/github/repo-size/CasualGaming/cag-web-2.svg?label=source%20size)
![Build size](https://img.shields.io/github/repo-size/CasualGaming/casualgaming.github.io.svg?label=build%20size)

Static Hugo website.

* Theme: [CasualGaming/fifty](https://github.com/CasualGaming/fifty)

## Project Structure
* `content/`: Web pages.
* `static/`: Static files placed in the web root of the built site.
* `themes/`: Contains the theme (after you've run `update-submodules.sh`).
* `layouts/`: Overrides or extensions for themes.
* `extra/`: Extra files, not used to build the site.
* `manage/`: Development scripts.
* `config.toml`: Config file for the site, contains front page content as well.

## Scripts and Commands
* `manage/build.sh`: Build the site.
* `manage/clean.sh`: Remove all temporary files.
* `manage/run.sh`: Starts the development server with hot reloading.
* `manage/update-submodules.sh`: Updates the submodules, including the theme.
* `docker build -t cag-web-2 .`: (Requires Docker) Build the site in a Docker container.
* `docker run --rm -p 8080:80 cag-web-2`: (Requires Docker) Run the site in a Docker container (using nginx) and forward port 8080 to it.

## Online Editing
Simple content changes and such can be easily changed directly within GitHub.
When the file is committed to master, the site is automatically rebuilt and redeployed.
Make sure the automatic build succeeds ([here](https://travis-ci.com/CasualGaming/cag-web-2)) and that the site is working after the deployment has finished ([here](https://casualgaming.no)) (at most 5 minutes after committing).

## Desktop Editing
Allows you to run the site locally while making changes to either content or the theme.

* Run `manage/update-submodules.sh` to clone the required submodules. This is required when the repo was just cloned or any submodules were updated.
* Run `manage/run.sh` to start a development server with hot reloading.

## Tips
* The favicons were generated using [Favicon Generator. For real.](https://realfavicongenerator.net/)
* Images can be compressed (esp. JPEGs), for instance with <https://compressjpeg.com/> at 75% quality.

# Casual Gaming Website
Static hugo website served by GitHub Pages.

## Branches
* **master-src**: Contains the hugo site source.
* **master**: Contains the generated site, served by GitHub Pages.

## Updating and building
* Checkout master-src.
* Run `./update-submodules.sh` (or `make update-submodules`) to clone the required submodules. Required when the repo was just cloned or any submodules were updated.
* Run `./run-server.sh` (or `make server`) to start a development server with hot reloading.
* Git commit and push as you usually would. The `publish` directory does not need to be included, but is hard to ignore since it's a submodule.
* Run `./publish.sh` (or `make publish`) to build and publish the site using the current user's credentials.

## Tips
* The favicons were generated using [Favicon Generator. For real.](https://realfavicongenerator.net/).
* Images can be compressed (esp. JPEGs), for instance with <https://compressjpeg.com/> at 75% quality.
* When updating the theme, make sure HEAD isn't detatched.

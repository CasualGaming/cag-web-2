# Casual Gaming Website
Static hugo website served by GitHub Pages.

## Branches
* **master-src**: Contains the hugo site source.
* **master**: Contains the generated site, served by GitHub Pages.

## Updating and building
* Checkout master-src.
* IMPORTANT: Run the update-submodules.sh script to clone the required submodules.
* Make sure the site is working properly using the local development server, by running either run-\*-server.sh scripts.
* Run the publish.sh script to build the site and push the generated site to the remote master branch.

## Tips
* The favicons were generated using [Favicon Generator. For real.](https://realfavicongenerator.net/).
* Images can be compressed (esp. JPEGs), for instance with <https://compressjpeg.com/> at 75% quality.

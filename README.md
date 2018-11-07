# Casual Gaming Website
The static hugo website for the organization, served by GitHub Pages.

## Branches
* **master-src**: Contains the hugo site source.
* **master**: Contains the generated site, served by GitHub Pages.

## Updating and building
* Checkout master-src.
* Run the update.sh script to clone the required submodules.
* Make sure the site is working properly using the local development server, by running either run-*-server.sh scripts.
* Run the build-and-publish.sh script to build the site and push the generated site to the remote master branch.
* Remember to always pull the master-src branch and the submodule branches, using the update.sh script.

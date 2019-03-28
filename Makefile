.PHONY: help
help:
	@echo "Targets:"
	@echo "help: Show help"
	@echo "clean: Cleans"
	@echo "update-submodules: Forces update of submodules"
	@echo "build: Build the project"
	@echo "server: Start local server for testing"

.PHONY: clean
clean:
	find public -regextype sed -not -regex "^public$$" -not -regex "^public/\\.git$$" -delete
	rm -rf server

.PHONY: update-submodules
update-submodules:
	./update-submodules.sh

.PHONY: build
build:
	./build.sh

.PHONY: server
server:
	./run-server.sh

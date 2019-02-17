.PHONY: help
help:
	@echo "Targets:"
	@echo "help: Show help"
	@echo "clean: Cleans"
	@echo "update-submodules: Forces update of submodules"
	@echo "server: Start local server for testing"
	@echo "publish: Publish site to the publishing branch using the current users git credentials"

.PHONY: clean
clean:
	find public -regextype sed -not -regex "^public$$" -not -regex "^public/\\.git$$" -delete
	rm -rf server

.PHONY: update-submodules
update-submodules:
	./update-submodules.sh

.PHONY: server
server:
	./run-server.sh

.PHONY: publish
publish:
	./publish.sh

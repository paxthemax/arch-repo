.PHONY: all
all: build install clean

.PHONY: build
build: ## Build the meta-package
	PKGEXT='.pkg.tar.zst' makepkg -sf

.PHONY: install
install: ## Install the meta-package
	SNAP_PAC_SKIP=true sudo -E pacman --noconfirm -U paxthemax-custom-fonts-*.pkg.tar.zst
.PHONY: clean
clean: ## Cleanup
	rm -rf pkg src *.pkg.tar* *.log

.PHONY: publish
publish: ## Publish to local repo, prepare to sync
	mv *.pkg.tar* ../../x86_64

.PHONY: help
help: ## This help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
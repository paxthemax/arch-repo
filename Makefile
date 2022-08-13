SHELL = bash
# PROJECT_ROOT := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

all: pre-sync sync post-sync

.PHONY: init-repo
init-repo: ## Initialize repo
	@echo "==> initializing pacman repo"
	./scripts/init.sh

.PHONY: pre-sync
pre-sync: ## Prepare repo for syncing
	@echo "==> preparing repo for package sync"
	./scripts/pre-sync.sh

.PHONY: sync
sync: ## Synchronize repo with prepared packages
	@echo "==> syncing packages"
	./scripts/sync.sh

.PHONY: post-sync
post-sync: ## Prepare repo for upload
	@echo "==> preparing repo for server upload"
	./scripts/post-sync.sh

.PHONY: wipe
wipe: ## Wipe the database and all packages
	@echo "==> wiping repo"
	./scripts/wipe.sh

HELP_FORMAT="    \033[36m%-15s\033[0m %s\n"
.PHONY: help
help: ## Display this usage information
	@echo "Valid targets:"
	@grep -E '^[^ ]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; \
			{printf $(HELP_FORMAT), $$1, $$2}'
	@echo


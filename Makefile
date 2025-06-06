##@ Build
dist/git-msg: main.go ## Build the git-msg binary.
	@mkdir -p dist
	@go build -o dist/git-msg ./main.go
	@chmod +x dist/git-msg

##@ Clean
.PHONY: clean
clean: ## Clean the build artifacts.
	@rm -rf dist

##@ Help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
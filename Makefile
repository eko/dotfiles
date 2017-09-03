.PHONY: help install

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Installs dotfiles into current environment
	@$(MAKE) DOTFILE=.vimrc install_file
	@$(MAKE) DOTFILE=.atom/config.cson install_file
	@$(MAKE) DOTFILE=.gitconfig install_file
	@$(MAKE) DOTFILE=.gitignore install_file
	@$(MAKE) DOTFILE=.hyper.js install_file
	@$(MAKE) DOTFILE=.aliases install_file
	@$(MAKE) DOTFILE=.exports install_file
	@$(MAKE) DOTFILE=.sources install_file
	@$(MAKE) DOTFILE=.zshrc install_file

install_file:
	@if [ ! -f ${HOME}/${DOTFILE} ]; then \
		echo ✔ Installing file: ${HOME}/${DOTFILE}; \
		cp ${DOTFILE} ${HOME}/${DOTFILE}; \
	else \
		echo ✖ File already exists: ${HOME}/${DOTFILE}; \
	fi \

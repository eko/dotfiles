.PHONY: help install

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Installs dotfiles into current environment
	@$(MAKE) DOTFILE=.aliases install_file
	@$(MAKE) DOTFILE=.brew install_file
	@$(MAKE) DOTFILE=.config/zed/settings.json install_file
	@$(MAKE) DOTFILE=.exports install_file
	@$(MAKE) DOTFILE=.functions install_file
	@$(MAKE) DOTFILE=.gitconfig install_file
	@$(MAKE) DOTFILE=.gitignore install_file
	@$(MAKE) DOTFILE=.iTerm2/com.googlecode.iterm2.plist install_file
	@$(MAKE) DOTFILE=.oh-my-zsh/themes/eko.zsh-theme install_file
	@$(MAKE) DOTFILE=.sources install_file
	@$(MAKE) DOTFILE=.tmux.conf install_file
	@$(MAKE) DOTFILE=.tmux/script-ip.sh install_file
	@$(MAKE) DOTFILE=.tools-versions install_file
	@$(MAKE) DOTFILE=.vimrc install_file
	@$(MAKE) DOTFILE=.vim/colors/jellybeans.vim install_file
	@$(MAKE) DOTFILE=.vim/coc-settings.json install_file
	@$(MAKE) DOTFILE=.zshrc install_file

install-encrypted: ## Installs encrypted dotfiles into current environment
	@$(MAKE) DOTFILE=.ssh/config install_encrypted_file
	@$(MAKE) DOTFILE=.otpkeys install_encrypted_file

install_file:
	@if [ ! -f ${HOME}/${DOTFILE} ]; then \
		echo ✔ Installing file: ${HOME}/${DOTFILE}; \
		cp ${DOTFILE} ${HOME}/${DOTFILE}; \
	else \
		echo ✖ File already exists: ${HOME}/${DOTFILE}; \
	fi \

install_encrypted_file:
	@if [ ! -f ${HOME}/${DOTFILE} ]; then \
		echo ✔ Installing encrypted file: ${HOME}/${DOTFILE}; \
		gpg2 --decrypt .encrypted/${DOTFILE} 2> /dev/null > ${HOME}/${DOTFILE}; \
	else \
		echo ✖ File already exists: ${HOME}/${DOTFILE}; \
	fi \

retrieve-files: ## Synchronize files from local host to git repository
	cp ~/.aliases .aliases
	cp ~/.brew .brew
	cp ~/.atom/config.cson .atom/config.cson
	cp ~/.config/zed/settings.json .config/zed/settings.json
	cp ~/.exports .exports
	cp ~/.functions .functions
	cp ~/.gitconfig .gitconfig
	cp ~/.gitignore .gitignore
	cp ~/.oh-my-zsh/themes/eko.zsh-theme .oh-my-zsh/themes/eko.zsh-theme
	cp ~/.sources .sources
	cp ~/.tmux.conf .tmux.conf
	cp ~/.vimrc .vimrc
	cp ~/.zshrc .zshrc
	cp ~/.iTerm2/com.googlecode.iterm2.plist .iTerm2/com.googlecode.iterm2.plist
	gpg2 --encrypt --recipient vincent --output .encrypted/.ssh/config ~/.ssh/config
	gpg2 --encrypt --recipient vincent --output .encrypted/.otpkeys ~/.otpkeys

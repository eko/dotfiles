# dotfiles

## Classic dotfiles

These dotfiles can be installed by running the following Make command:

```bash
$ make install

✖ File already exists: /Users/vincent/.atom/config.cson
✖ File already exists: /Users/vincent/.gitconfig
✔ Installing file: /Users/vincent/.gitignore
[...]
```

## Encrypted dotfiles

Before installing encrypted dotfiles, you have to import your private gpg key by typing:

```bash
$ gpg2 --import private.key
```

Then, encrypted Makefiles can be automatically installed by typing:

```bash
$ make install-encrypted

✔ Installing encrypted file: /Users/vincent/.ssh/config
```

## List of dotfiles

Here is the detail of available dotfiles:

## [.aliases](https://raw.github.com/eko/dotfiles/master/.aliases)
  * Install to `~/.aliases`

## [.atom/config.cson](https://raw.github.com/eko/dotfiles/master/.atom/config.cson)
  * Download [Atom](https://atom.io)
  * Install to `~/.atom/config.cson`

## [.brew](https://raw.github.com/eko/dotfiles/master/.brew)
  * Install to `~/.brew`
  * Then, run `./.brew` to install Homebrew libraries/applications

## [.editorconfig](https://raw.github.com/eko/dotfiles/master/.editorconfig)
  * Install to `project/` directory

## [.exports](https://raw.github.com/eko/dotfiles/master/.exports)
  * Install to `~/.exports`

## [.functions](https://raw.github.com/eko/dotfiles/master/.functions)
  * Install to `~/.functions`

## [.gitconfig](https://raw.github.com/eko/dotfiles/master/.gitconfig)
  * Install to `~/.gitconfig`

## [.gitignore](https://raw.github.com/eko/dotfiles/master/.gitignore)
  * Install to `~/.gitignore`
  * Type `git config --global core.excludesfile ~/.gitignore`

## [.iTerm2/com.googlecode.iterm2.plist](https://raw.github.com/eko/dotfiles/master/.iTerm2/com.googlecode.iterm2.plist)
  * Install to `~/.iTerm2/com.googlecode.iterm2.plist`
  * Do not forget to configure iTerm2 (Preferences > General) at the bottom to load configuration from `~/.iTerm2` directory

## [.oh-my-zsh/themes/eko.zsh-theme](https://raw.github.com/eko/dotfiles/master/.oh-my-zsh/themes/eko.zsh-theme)
  * Install to `~/.oh-my-zsh/themes/eko.zsh-theme`

## [.sources](https://raw.github.com/eko/dotfiles/master/.sources)
  * Install to `~/.sources`

## [.tmux.conf](https://raw.github.com/eko/dotfiles/master/.tmux.conf)
  * Install to `~/.tmux.conf`

## [.vimrc](https://raw.github.com/eko/dotfiles/master/.vimrc)
  * Install to `~/.vimrc`
  * Type `vim +PlugInstall +qall` to install vim plugins

## [.vim](https://raw.github.com/eko/dotfiles/master/.vim)
  * Install to `~/.vim`

## [.zshrc](https://raw.github.com/eko/dotfiles/master/.zshrc)
  * Install to `~/.zshrc`

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

## [.gitconfig](https://raw.github.com/eko/dotfiles/master/.gitconfig)
  * Install to `~/.gitconfig`

## [.gitignore](https://raw.github.com/eko/dotfiles/master/.gitignore)
  * Install to `~/.gitignore`
  * Type `git config --global core.excludesfile ~/.gitignore`

## [.hyper.js](https://raw.github.com/eko/dotfiles/master/.hyper.js)
  * Install to `~/.hyper.js`

## [.oh-my-zsh/themes/eko.zsh-theme](https://raw.github.com/eko/dotfiles/master/.oh-my-zsh/themes/eko.zsh-theme)
  * Install to `~/.oh-my-zsh/themes/eko.zsh-theme`

## [.sources](https://raw.github.com/eko/dotfiles/master/.sources)
  * Install to `~/.sources`

## [.tmux.conf](https://raw.github.com/eko/dotfiles/master/.tmux.conf)
  * Install to `~/.tmux.conf`

## [.vimrc](https://raw.github.com/eko/dotfiles/master/.vimrc)
  * Install to `~/.vimrc`
  * Type `vim +PlugInstall +qall` to install vim plugins

## [.zshrc](https://raw.github.com/eko/dotfiles/master/.zshrc)
  * Install to `~/.zshrc`

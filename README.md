# Dotfiles, managed by Stow

This project is managing dotfiles using gnu `stow`.

# Usage

# Installation

- [ ] go to your home directory

```sh
cd ~/
```

- [ ] clone this project

```sh
git clone git@github.com:gregorlogar991/dot-files.git && cd dot-files
```

- [ ] Install everything with Brewfile

```sh
brew bundle install --file=./Brewfile
```

- [ ] Create symlinks with stow

```sh
stow
```

- [ ] Configure mac

```sh
./macos-defaults.sh
```

- [ ] Restart computer

## Uninstall

```sh
stow -Dv
```

## Update

```sh
./export.sh all
```

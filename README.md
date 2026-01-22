# Dotfiles
My dotfiles and a minimal step by step guide to setting up my work environment.

## Overview
- Terminal
- Windows
- WSL2

## Terminal
1. Download [Windows Terminal](https://learn.microsoft.com/en-us/windows/terminal/install).
2. Download and enable DaddyTimeMono Nerd Font.
3. Set colorscheme to Tango Dark.
4. Update the keybindings section in settings.json to [keybindings](./keybindings.json).

## Windows
1. Remove and unpin the usual Windows fluff.
2. Pin terminal and browser.

## WSL2
1. Download and install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).
2. Set Ubuntu as the default profile in Windows Terminal.
3. Run `sudo apt install zsh`.
4. Run `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`.
5. Run `sudo apt-get update && sudo apt-get upgrade`.
6. Install latest stable version of Neovim.
7. Add `alias vim="nvim"` to `.zshrc`.
8. Add `export PATH="$PATH:/opt/nvim-linux-x86_64/bin"` to `.zshrc`.
9. Restart terminal.

### Neovim
1. Run `sudo apt update`.
2. Run `sudo apt install git gcc ripgrep unzip make`.
3. Run `mkdir ~/.config`.
4. Clone my [fork of nvim](https://github.com/wiu753/nvim/tree/config).`
5. Follow any other installation instruction from the `README.md` in the forked repository.


### Tmuxifier
1. Run `git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier`.
2. Add `export PATH="$HOME/.tmuxifier/bin:$PATH"` to your path.
3. Add [this](./work.session.sh) file to `~/.tmuxifier/layouts`.
4. Run `tmuxifier load-session work` when starting to work.

### Symlinking tmux, tmuxifier, and zshrc
1. Clone [this](https://www.github.com/wiu753/dotfiles) repository.
2. Change directory to the dotfiles repository `cd /path/to/dotfiles`.
3. Run `ln -s $(pwd)/.tmux.conf ~/.tmux.conf`.
4. Run `ln -s $(pwd)/.zshrc ~/.zshrc`.
5. Run `ln -s $(pwd)/work.session.sh ~/.tmuxifier/layouts/work.session.sh`.


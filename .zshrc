# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:$HOME/.dotnet/tools/"
export PATH="$HOME/.tmuxifier/bin:$PATH"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

ZSH_THEME="robbyrussell"

# Select previous commands with Vim-like keys
bindkey '^k' up-line-or-history
bindkey '^j' down-line-or-history

# Remove the beeping sound
unsetopt correct_all
unsetopt correct
unsetopt BEEP

plugins=(git)

alias vim="nvim"
alias gl="git log --graph --oneline --decorate --all"

source $ZSH/oh-my-zsh.sh

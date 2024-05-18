export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/home/wiu/.local/bin/"

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
unsetopt BEEP

alias vim="lvim"
alias fp="fzf --preview 'cat {}'"
alias fm='vim $(fzf --preview '\''cat {}'\'')'

ZSH_THEME=robbyrussell

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
  export EDITOR='vim'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
. "$HOME/.cargo/env"

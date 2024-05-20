export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/home/wiu/.local/bin/"
export PATH="$HOME/.tmuxifier/bin:$PATH"

eval "$(tmuxifier init -)"

DISABLE_AUTO_TITLE="true"
unsetopt BEEP

bindkey '^k' up-line-or-history
bindkey '^j' down-line-or-history

alias vim="lvim"
alias fp="fzf --preview 'cat {}'"
alias fm='vim $(fzf --preview '\''cat {}'\'')'
alias dps='docker ps --format "{{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}" | awk '\''{split($2, img, "/"); image_name = img[length(img)-1] "/" img[length(img)]; if (length(image_name) > 50) image_name = "..." substr(image_name, length(image_name)-46, 50); printf "\033[1;32m%s\t\033[1;33m%-50s\t\033[1;36m%-35s\t\033[1;35m%-12s\033[0m\n", $1, image_name, $3, $4}'\'''
alias dc="docker compose"

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

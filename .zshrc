# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:$HOME/.dotnet/tools/"
export PATH="$PATH:/opt/dotMemory"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

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
# Show git log's with increasing levels of information
alias lg="git log --all --decorate --oneline --graph"
alias lg1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
alias lg2='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)"'
alias dps='docker ps --format "{{.Status}}\t{{.Names}}\t{{.ID}}" | awk -F"\t" '\''BEGIN{printf "%-25s %-25s %-15s\n","STATUS","NAMES","ID"}{printf "\033[1;32m%-25s\033[0m \033[1;34m%-25s\033[0m \033[1;33m%-15s\033[0m\n",$1,$2,$3}'\'''

source $ZSH/oh-my-zsh.sh

function prompt_robbyrussell_precmd() {
  vcs_info
}

function prompt_robbyrussell_setup() {
  autoload -Uz vcs_info
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git:*' formats '(%b)'   # only show branch, no 'git:'
  zstyle ':vcs_info:git:*' actionformats '(%b|%a)'
  precmd_functions+=(prompt_robbyrussell_precmd)

  PROMPT='%{$fg[green]%}➜ %{$fg[cyan]%}%~%{$reset_color%} %{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%} '
}

prompt_robbyrussell_setup

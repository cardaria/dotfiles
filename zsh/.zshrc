# Custom location for starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias t="clear"
alias cd="z"
alias atm="pwd"
alias cnf="cd ~/.config"
alias ..="cd .."
alias vi="nvim"
alias vim="nvim"
alias vif='nvim "$(fzf)"'


# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


source <(fzf --zsh)

# Add the following to the end
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

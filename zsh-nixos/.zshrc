SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt sharehistory

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

bindkey -e
bindkey '^j' history-search-backward
bindkey '^k' history-search-forward

eval "$(fzf --zsh)"
eval "$(pay-respects zsh)"
eval "$(zoxide init zsh)"

alias cd='z'
alias j='just'
alias nvimc='cd ~/dotfiles/nvim/.config/nvim && nvim -c "Neotree" init.lua'

# bun completions
[ -s "/Users/joshnies/.bun/_bun" ] && source "/Users/joshnies/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


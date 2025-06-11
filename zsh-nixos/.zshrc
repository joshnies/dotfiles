# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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


source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --zsh)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias f)"
eval "$(zoxide init zsh)"

alias j='just'
alias nvimc='cd ~/dotfiles/.config/nvim && nvim -c "Neotree" init.lua'
alias obs='cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/personal && nvim -c "Neotree position=current"'

# bun completions
[ -s "/Users/joshnies/.bun/_bun" ] && source "/Users/joshnies/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


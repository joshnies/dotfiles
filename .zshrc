source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --zsh)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias f)"
eval "$(zoxide init zsh)"

alias nvimc='cd ~/.config/nvim && nvim -c "Neotree" init.lua'
alias obs='cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/personal && nvim -c "Neotree position=current"'
alias j='just'

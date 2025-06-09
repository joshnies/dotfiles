source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --zsh)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias f)"
eval "$(zoxide init zsh)"

alias j='just'
alias nvimc='cd ~/dotfiles/.config/nvim && nvim -c "Neotree" init.lua'
alias obs='cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/personal && nvim -c "Neotree position=current"'
alias gap='f(){ git add . && git commit -m "$1" && git push origin; unset -f f; };
f'

# bun completions
[ -s "/Users/joshnies/.bun/_bun" ] && source "/Users/joshnies/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# libsql
export PATH="~/dev/libsql/libsql-sqlite3/libsql:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


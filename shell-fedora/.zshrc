# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# git
gpush() {
	git add .
	git commit -m "$1"
	git push
}

gpull() {
	git fetch && git pull
}

alias gp='gpush'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# applications
path+=~/Applications/zen


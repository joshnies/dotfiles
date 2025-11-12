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

# TODO: nvm

# TODO: zsh-syntax-highlighting


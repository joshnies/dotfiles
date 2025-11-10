. "$HOME/.cargo/env"

# Stage and commit all outstanding changes in git.
gac() {
    git add . && git commit -m "$1"
}

# State, commit and push all outstanding changes in git.
gpush() {
    git add . && git commit -m "$1" && git push origin
}

# State, commit and push all outstanding changes in git.
gpull() {
    git fetch && git pull
}

alias gp=gpush

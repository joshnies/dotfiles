. "$HOME/.cargo/env"

# Stage and commit all outstanding changes in git.
gac() {
    git add . && git commit -m "$1"
}

# State, commit and push all outstanding changes in git.
gp() {
    git add . && git commit -m "$1" && git push origin
}


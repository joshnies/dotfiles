# vulkan
export VULKAN_SDK=~/vulkan/1.4.313.0/x86_64
path+=$VULKAN_SDK/bin
export LD_LIBRARY_PATH=$VULKAN_SDK/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d
export VK_ADD_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

path+=/home/josh/dev/basis_universal/bin
path+=/home/josh/dev/odin
export PATH

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

gpush() {
	git add .
	git commit -m "$1"
	git push
}

gpull() {
	git fetch && git pull
}

alias gp='gpush'


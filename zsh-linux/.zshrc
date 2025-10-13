# vulkan
export VULKAN_SDK=~/vulkan/1.4.313.0/x86_64
path+=$VULKAN_SDK/bin
export LD_LIBRARY_PATH=$VULKAN_SDK/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d
export VK_ADD_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d

# odin
path+=/home/josh/dev/odin

export PATH

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


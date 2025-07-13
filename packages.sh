# /bin/bash

# Array of packages to install
packages=(
    "aur/asdf-vm-git"
    "extra/zerotier-one"
    "cursor-bin"
    "gvfs-smb"
)

# Install all packages without user input
yay -S --noconfirm "${packages[@]}"

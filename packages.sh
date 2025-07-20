# /bin/bash

# Array of packages to install
packages=(
    "aur/asdf-vm-git"
    "extra/zerotier-one"
    "extra/base-devel"
    "aur/bat"
    "extra/samba"
    "cursor-bin"
    "extra/openssh"
    "gvfs-smb"
)

# Install all packages without user input
yay -S --noconfirm "${packages[@]}"
sudo systemctl enable --now sshd

# Append bash_includes to ~/.bashrc if not already present
BASH_INCLUDES_CONTENT=$(cat bash_includes)
if ! grep -qF "$BASH_INCLUDES_CONTENT" ~/.bashrc; then
    echo "$BASH_INCLUDES_CONTENT" >> ~/.bashrc
    echo "Appended bash_includes to ~/.bashrc"
else
    echo "bash_includes already in ~/.bashrc"
fi
# Source the updated .bashrc (optional, for immediate effect in current session)
source ~/.bashrc
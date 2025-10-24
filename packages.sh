# /bin/bash

# Array of packages to install
packages=(
    "extra/zerotier-one"
    "extra/base-devel"
    "aur/bat"
    "extra/samba"
    "extra/openssh"
    "gvfs-smb"
)

# Install all packages without user input
yay -S --noconfirm "${packages[@]}"
sudo systemctl enable --now sshd
  
# Update bash_includes in ~/.bashrc using markers
sed -i '/# BEGIN OMARCHY_BASH_INCLUDES/,/# END OMARCHY_BASH_INCLUDES/d' ~/.bashrc
  
echo '# BEGIN OMARCHY_BASH_INCLUDES' >> ~/.bashrc
cat bash_includes >> ~/.bashrc
echo '# END OMARCHY_BASH_INCLUDES' >> ~/.bashrc
  
echo "Updated bash_includes in ~/.bashrc"
  
# Source the updated .bashrc (optional, for immediate effect in current session)
source ~/.bashrc

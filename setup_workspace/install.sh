#! /bin/bash

# Programmes that might exist in repositiries
repo_programmes=
(
    git
    vim
    neovim
    gcc
    python
    python3
    make
    cmake
    nodejs
    npm
    yaml
    curl
    wget
    zsh
    tmux
    fzf
    snap
    chromium
)

# And also should be downloaded:
additional_programmes=
(
    openconnect
    vncviewer
    protonvpn
    clion
    qtcreator
    snap
    spotify
    discord
    tor-browser
)

################################################################################
################################ Initial block #################################
################################################################################

if [ -z "${install_command}" ]; then
    echo "Write in terminal \'export __install_command=\"...\"\' where you"
    echo "should replace ... by installation command and needed arguments like:"
    echo "\"sudo apt install\" or \"sudo pacman -Syu\" or \"sudo yum install\""
    exit 1
fi

which git > /dev/null
if [ $? -ne 0 ]; then
    echo "Update your system, install \"git\" and then continue."
    exit 2
fi

mkdir ${HOME}/Projects
mkdir ${HOME}/Images
mkdir ${HOME}/Applications
mkdir -p ${HOME}/Documents/{civil,dev}
mkdir -p ${HOME}/Pictures/{ricardo_milos,jojo}

################################################################################
############################# Installation block ###############################
################################################################################

"${install_command}" ${repo_programmes[@]}

# My repositories
git clone https://github.com/georgiykulak/my_scripts.git ${HOME}/Projects/Scripts
git clone https://github.com/georgiykulak/my_configs.git ${HOME}/.my_configs
git clone #TODO ${HOME}/Documents/books
git clone #TODO ${HOME}/University

# Other repositories
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

################################################################################
############################# Configuration block ##############################
################################################################################

# General settings
${HOME}/Projects/Scripts/prepare.sh #TODO
${HOME}/.my_configs/prepare.sh #TODO

# Applications' settings
# zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
sudo chsh -s $(which zsh)
cp ${HOME}/.my_configs/zshrc ${HOME}/.zshrc
cp ${HOME}/.my_configs/zshrc.pre-oh-my-zsh ${HOME}/.zshrc.pre-oh-my-zsh

# neovim

# sublime-text #TODO + tabnine
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && \
sudo pacman-key --add sublimehq-pub.gpg && \
sudo pacman-key --lsign-key 8A8F901A && \
rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
"${install_command}" sublime-text

# telegram
#TODO
wget https://telegram.org/dl/desktop/linux

# spotify

################################################################################
########################### Backup restoring block #############################
################################################################################

#TODO

#!/bin/sh

echo "Setting up your Machine..."

###################  TOOLS and PKGs  ###################

sudo apt update 
sudo apt upgrade -y
sudo apt install -y curl wget git unzip
# development tools
sudo apt install -y build-essential cmake python3-dev python3-pip
# system tools
sudo apt install -y htop neofetch net-tools tree 


###################  ZSH  ###################

OMZ_THEME_DIR=$HOME/.oh-my-zsh/custom/themes
OMZ_PLUGINS_DIR=$HOME/.oh-my-zsh/custom/plugins


# check for zsh and install if we don't have it

if test ! $(which zsh); then
  sudo apt-get install -y zsh
fi

# switch shell to zsh permanently if it isn't already
if [ "$SHELL" != "/usr/bin/zsh" ]; then
  chsh -s $(which zsh)
fi

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# install omz plugins

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $OMZ_PLUGINS_DIR/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $OMZ_PLUGINS_DIR/zsh-autosuggestions



# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the dotfiles
sudo rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

###################  COLORLS  ###################

# install  colorls
sudo apt install ruby ruby-dev ruby-colorize
sudo gem install colorls

###################  BAT  ###################


################   STARSHIP  ###################


###################  FONTS  ###################



# check for starship and install if we don't have it
if test ! $(which starship); then
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi






# remove $HOME/.config and symlink the .config directory from the dotfiles
sudo rm -rf $HOME/.config
ln -s $HOME/dotfiles/.config $HOME/.config





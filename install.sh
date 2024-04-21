#!/bin/bash

echo "Setting up your Machine..."

###################  TOOLS and PKGs  ###################

PKGs=(
  "zsh"
  "git"
  "curl"
  "wget"
  "unzip"
  "build-essential"
  "cmake"
  "python3-dev"
  "python3-pip"
  "htop"
  "neofetch"
  "net-tools"
  "tree"
  "ruby"
  "ruby-dev"
  "ruby-colorize"
  "bat"
  "fd-find"
  "ripgrep"
  "fzf"
  "tmux")


sudo apt-get update
# install packages

for pkg in "${PKGs[@]}"; do
  if test ! $(which $pkg); then
    sudo apt-get install -y $pkg
  fi
done


sudo gem install colorls



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



################   STARSHIP  ###################

# check for starship and install if we don't have it
if test ! $(which starship); then
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

################   TMUX  ###################

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm




################   NEOVIM  ###################

# install neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
















#### apply the .config directory from the dotfiles
# remove $HOME/.config and symlink the .config directory from the dotfiles
sudo rm -rf $HOME/.config
ln -s $HOME/dotfiles/.config $HOME/.config





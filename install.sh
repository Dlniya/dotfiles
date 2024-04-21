#!/bin/sh

echo "Setting up your Machine..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# check for starship and install if we don't have it
if test ! $(which starship); then
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi


# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the dotfiles
sudo rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# check if shell not zsh and change it to zsh
if [ $SHELL != "/bin/zsh" ]; then
  chsh -s $(which zsh)
fi

# remove $HOME/.config and symlink the .config directory from the dotfiles
sudo rm -rf $HOME/.config
ln -s $HOME/dotfiles/.config $HOME/.config





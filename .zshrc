# Path to dotfiles.
export DOTFILES=$HOME/dotfiles

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)





source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

source $(dirname $(gem which colorls))/tab_complete.sh

for file in $HOME/dotfiles/aliases/*.zsh; do
    [ -r "$file" ] && source "$file"
done

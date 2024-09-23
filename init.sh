echo "Changing default shell to zsh"
chsh -s $(which zsh)

echo "cd to ~"
cd ~

echo "dotfiles"
git clone git@github.com:exacs/dotfiles.git

echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Install bundle"
cd dotfiles
brew tap Homebrew/bundle
brew bundle

echo "Symlink dotfiles"
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.zshrc ~/.zshrc

echo "Install node, npm..."
curl -fsSL https://fnm.vercel.app/install | bash

# Create ".node-version" with text "lts/*"
# Run fnm install

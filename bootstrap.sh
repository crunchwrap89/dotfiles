#!/bin/bash

# ~Manually install NeoVim
echo "install neovim"
mkdir -p ~/.local
cd ~/.local
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
mkdir ~/.local/bin
ln -s ~/.local/squashfs-root/AppRun ~/.local/bin/nvim

echo "install ripgrep"
apt-get install ripgrep

echo "switch to current LTS node"
nvm use v20.11.0

echo "bring in neovim and tmux config"
# Bring in our custom neovim config
echo "XDG_CONFIG_HOME=$HOME" >>~/.profile
mkdir ~/dotfiles
npx degit https://github.com/crunchwrap89/dotfiles ~/dotfiles
mv ~/dotfiles/.config/nvim ~/.config/nvim
mv ~/dotfiles/.tmux.conf ~/.tmux.conf

cd /workspaces/$RepositoryName
echo "update plugins"
nvim --headless +":UpdateRemotePlugins" +"q!"
echo "add LSP for vue"
nvim --headless +":MasonInstall vue-language-server" +"q!"
echo "add treesitter for vue"
nvim --headless +":TSInstall vue" +"q!"

echo "get git completions"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
echo "source ~/.git-completion.bash" >>~/.bashrc

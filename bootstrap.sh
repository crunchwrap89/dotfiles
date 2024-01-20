#!/bin/bash

cp .tmux.conf ~
cp .gitconfig ~

# ~Manually install NeoVim
mkdir -p ~/.local
cd ~/.local
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
mkdir ~/.local/bin
ln -s ~/.local/squashfs-root/AppRun ~/.local/bin/nvim

# Bring in our custom neovim config
echo "XDG_CONFIG_HOME=$HOME" >>~/.profile
mkdir ~/dotfiles
npx degit https://github.com/crunchwrap89/dotfiles ~/dotfiles
mv ~/dotfiles/.config/nvim ~/.config/nvim
mv ~/dotfiles/.tmux.conf ~/.tmux.conf

cd /workspaces/$RepositoryName
# poetry run pip install pynvim ipython  # Avoid if we can help it
nvim --headless +":UpdateRemotePlugins" +"q!"

# Setup git completions for bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
echo "source ~/.git-completion.bash" >>~/.bashrc

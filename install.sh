log_file=~/install_progress_log.txt

sudo apt-get -y install zsh
if type -p zsh >/dev/null; then
	echo "zsh Installed" >>$log_file
else
	echo "zsh FAILED TO INSTALL!!!" >>$log_file
fi

sudo apt-get -y install ripgrep
if type -p ripgrep >/dev/null; then
	echo "ripgrep Installed" >>$log_file
else
	echo "ripgrep FAILED TO INSTALL!!!" >>$log_file
fi

sudo apt-get -y install fd-find
if type -p fd-find >/dev/null; then
	echo "fd-find Installed" >>$log_file
else
	echo "fd-find FAILED TO INSTALL!!!" >>$log_file
fi

sudo apt-get -y install stow
if type -p stow >/dev/null; then
	echo "stow Installed" >>$log_file
else
	echo "stow FAILED TO INSTALL!!!" >>$log_file
fi

sudo apt-get -y install tmux
if type -p tmux >/dev/null; then
	echo "tmux Installed" >>$log_file
else
	echo "tmux FAILED TO INSTALL!!!" >>$log_file
fi

sudo apt-get -y install zoxide
if type -p zoxide >/dev/null; then
	echo "zoxide Installed" >>$log_file
else
	echo "zoxide FAILED TO INSTALL!!!" >>$log_file
fi

# install neovim
cd ~/
sudo apt-get -y install ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# install lazygit
cd ~/
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# install lazyvim
cd ~/

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# install starship
cd ~/
git clone https://github.com/starship/starship.git --recursive
cd starship
cd install
sh install.sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install TPM
cd ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

#install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.zshrc
nvm install --lts
nvm use --lts

# install fzf
cd ~/
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

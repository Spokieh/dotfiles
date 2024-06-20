#!/bin/bash

log_file=~/install_progress_log.txt

timestamp=$(date +"%Y%m%d_%H%M")
echo $timestamp >>$log_file

sudo apt-get update

# Check if zsh is installed
if [ -f /bin/zsh ]; then
	echo "zsh is already installed" >>$log_file
else
	# Install zsh
	sudo apt-get install zsh -y
	if [ -f /bin/zsh ]; then
		echo "zsh installed successfully" >>$log_file
	else
		echo "zsh installation failed" >>$log_file
	fi
fi

# Check if ripgrep is installed
if [ -f /usr/bin/rg ]; then
	echo "ripgrep is already installed" >>$log_file
else
	# Install ripgrep
	sudo apt-get install ripgrep -y
	if [ -f /usr/bin/rg ]; then
		echo "ripgrep installed successfully" >>$log_file
	else
		echo "ripgrep installation failed" >>$log_file
	fi
fi

# Check if fd-find is installed
if [ -f /usr/bin/fdfind ]; then
	echo "fd-find is already installed" >>$log_file
else
	# Install fd-find
	sudo apt-get install fd-find -y
	if [ -f /usr/bin/fdfind ]; then
		echo "fd-find installed successfully" >>$log_file
	else
		echo "fd-find installation failed" >>$log_file
	fi
fi

# Check if ranger is installed
if [ -f /usr/bin/ranger ]; then
	echo "ranger is already installed" >>$log_file
else
	# Install fd-find
	sudo apt-get install ranger -y
	if [ -f /usr/bin/ranger ]; then
		echo "ranger installed successfully" >>$log_file
	else
		echo "ranger installation failed" >>$log_file
	fi
fi

# Check if stow is installed
if [ -f /usr/bin/stow ]; then
	echo "stow is already installed" >>$log_file
else
	# Install stow
	sudo apt-get install stow -y
	if [ -f /usr/bin/stow ]; then
		echo "stow installed successfully" >>$log_file
	else
		echo "stow installation failed" >>$log_file
	fi
fi

# Check if tmux is installed
if [ -f /usr/bin/tmux ]; then
	echo "tmux is already installed" >>$log_file
else
	# Install tmux
	sudo apt-get install tmux -y
	if [ -f /usr/bin/tmux ]; then
		echo "tmux installed successfully" >>$log_file
	else
		echo "tmux installation failed" >>$log_file
	fi
fi

# Check if tpm is installed
if [ -d ~/.tmux/plugins/tpm ]; then
	echo "tpm is already installed" >>$log_file
else
	# Install TPM
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	if [ -d ~/.tmux/plugins/tpm ]; then
		echo "tpm installed successfully" >>$log_file
	else
		echo "tpm installation failed" >>$log_file
	fi
fi

# Check if zoxide is installed
if [ -f /usr/bin/zoxide ]; then
	echo "zoxide is already installed" >>$log_file
else
	# Install zoxide
	sudo apt-get install zoxide -y
	if [ -f /usr/bin/zoxide ]; then
		echo "zoxide installed successfully" >>$log_file
	else
		echo "zoxide installation failed" >>$log_file
	fi
fi

# Check if NeoVim is installed
if [ -f /usr/local/bin/nvim ]; then
	echo "NeoVim is already installed" >>$log_file
else
	# Install NeoVim
	sudo apt-get install ninja-build gettext cmake unzip curl build-essential -y
	git clone https://github.com/neovim/neovim ~/neovim
	cd ~/neovim
	git checkout stable
	sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
	if [ -f /usr/local/bin/nvim ]; then
		echo "NeoVim installed successfully" >>$log_file
	else
		echo "NeoVim installation failed" >>$log_file
	fi
fi

# Check if lazygit is installed
if [ -f /usr/local/bin/lazygit ]; then
	echo "lazygit is already installed" >>$log_file
else
	# Install lazygit
	cd ~/
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	if [ -f /usr/local/bin/lazygit ]; then
		echo "lazygit installed successfully" >>$log_file
	else
		echo "lazygit installation failed" >>$log_file
	fi
fi

# Check if lazyvim is installed
if [ -d ~/.config/nvim ]; then
	echo "lazyvim is already installed" >>$log_file
else
	# Install lazyvim
	# required
	mv ~/.config/nvim{,.bak}
	# optional but recommended
	mv ~/.local/share/nvim{,.bak}
	mv ~/.local/state/nvim{,.bak}
	mv ~/.cache/nvim{,.bak}
	# clone lazyvim starter
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	rm -rf ~/.config/nvim/.git
	if [ -d ~/.config/nvim ]; then
		echo "lazyvim installed successfully" >>$log_file
	else
		echo "lazyvim installation failed" >>$log_file
	fi
fi

# Check if starship is installed
if [ -f /usr/local/bin/starship ]; then
	echo "starship is already installed" >>$log_file
else
	# Install starship
	git clone https://github.com/starship/starship.git --recursive ~/starship
	sh ~/starship/install/install.sh
	if [ -f /usr/local/bin/starship ]; then
		echo "starship installed successfully" >>$log_file
	else
		echo "starship installation failed" >>$log_file
	fi
fi

# Check if nvm is installed
if [ -d ~/.nvm ]; then
	echo "nvm is already installed" >>$log_file
else
	# Install nvm
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	if [ -d ~/.nvm ]; then
		echo "nvm installed successfully" >>$log_file
	else
		echo "nvm installation failed" >>$log_file
	fi

fi

# Check if FZF is installed
if [ -d ~/.fzf ]; then
	echo "FZF is already installed" >>$log_file
else
	# Install fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

	if [ -d ~/.fzf ]; then
		echo "FZF installed successfully" >>$log_file

	else
		echo "FZF installation failed" >>$log_file
	fi

fi

# Copy dotfiles
cp -R ~/dotfiles/local_dotfiles ~/local_dotfiles

# Rename current dotfiles
mv ~/.config/nvim/init.lua ~/.config/nvim/init.lua_$timestamp
mv ~/.config/nvim/lua ~/.config/nvim/lua_$timestamp
# mv ~/.config/starship.toml ~/.config/starship.toml_$timestamp
mv ~/.zshrc ~/.zshrc_$timestamp

# GNU Stow the files
cd ~/local_dotfiles
stow .
source ~/.zshrc

# Check if Oh My Zsh is installed
if [ -d ~/.oh-my-zsh ]; then
	echo "Oh My Zsh is already installed" >>$log_file
else
	# Install Oh My Zsh
	cd ~/dotfiles
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	if [ -d ~/.oh-my-zsh ]; then
		echo "Oh My Zsh installed successfully" >>$log_file

	else
		echo "Oh My Zsh installation failed" >>$log_file
	fi
fi

# Check if zsh-autosuggestions is installed
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
	echo "zsh-autosuggestions is already installed" >>$log_file
else
	# Install zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
		echo "zsh-autosuggestions installed successfully" >>$log_file
	else
		echo "zsh-autosuggestions installation failed" >>$log_file
	fi
fi

# Check if zsh-syntax-highlighting is installed
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
	echo "zsh-syntax-highlighting is already installed" >>$log_file
else
	# Install zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
		echo "zsh-syntax-highlighting installed successfully" >>$log_file
	else
		echo "zsh-syntax-highlighting installation failed" >>$log_file
	fi
fi

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy -Spokieh"
rm -rf $log_file

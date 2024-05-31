#!/bin/bash

log_file=~/install_progress_log.txt

sudo apt-get update

# Check if zsh is installed
if [ -f /bin/zsh ]; then
    echo "zsh is already installed" >> $log_file
else
    # Install zsh
    sudo apt-get install zsh -y
    if [ -f /bin/zsh ]; then
        echo "zsh Installed" >>$log_file
    else
        echo "zsh FAILED TO INSTALL!!!" >>$log_file
    fi
fi

# Check if ripgrep is installed
if [ -f /usr/bin/rg ]; then
    echo "ripgrep is already installed" >> $log_file
else
    # Install ripgrep
    sudo apt-get install ripgrep -y
    if [ -f /usr/bin/rg ]; then
        echo "ripgrep Installed" >>$log_file
    else
        echo "ripgrep FAILED TO INSTALL!!!" >>$log_file
    fi
fi

# Check if fd-find is installed
# if [ -f /usr/bin/find ]; then
#    echo "fd-find is already installed" >> $log_file
#else
    # Install fd-find
    sudo apt-get install fd-find -y
#    if [ -f /usr/bin/find ]; then
#        echo "fd-find Installed" >>$log_file
#    else
#        echo "fd-find FAILED TO INSTALL!!!" >>$log_file
#    fi
#fi

# Check if stow is installed
if [ -f /usr/bin/stow ]; then
    echo "stow is already installed" >> $log_file
else
    # Install stow
    sudo apt-get install stow -y
    if [ -f /usr/bin/stow ]; then
        echo "stow Installed" >>$log_file
    else
        echo "stow FAILED TO INSTALL!!!" >>$log_file
    fi
fi

# Check if tmux is installed
if [ -f /usr/bin/tmux ]; then
    echo "tmux is already installed" >> $log_file
else
    # Install tmux
    sudo apt-get install tmux -y
    if [ -f /usr/bin/tmux ]; then
        echo "tmux Installed" >>$log_file
    else
        echo "tmux FAILED TO INSTALL!!!" >>$log_file
    fi
fi

# Check if tpm is installed
if [ -d ~/.tmux/plugins/tpm ]; then
    echo "tpm is already installed" >> $log_file
else
    # Install TPM
    cd ~/
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source ~/.tmux.conf
fi

# Check if zoxide is installed
if [ -f /usr/bin/zoxide ]; then
    echo "zoxide is already installed" >> $log_file
else
    # Install zoxide
    sudo apt-get install zoxide -y
    if [ -f /usr/bin/zoxide ]; then
        echo "zoxide Installed" >>$log_file
    else
        echo "zoxide FAILED TO INSTALL!!!" >>$log_file
    fi
fi

# Check if NeoVim is installed
if [ -f /usr/local/bin/nvim ]; then
    echo "NeoVim is already installed" >> $log_file
else
    # Install NeoVim
    cd ~/
    sudo apt-get install ninja-build gettext cmake unzip curl build-essential -y
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable
    sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    if [ -f /usr/local/bin/nvim ]; then
        echo "NeoVim Installed" >>$log_file
    else
        echo "NeoVim FAILED TO INSTALL!!!" >>$log_file
    fi
fi

# Check if lazygit is installed
if [ -f /usr/local/bin/lazygit ]; then
    echo "lazygit is already installed" >> $log_file
else
    # Install lazygit
    cd ~/
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    if [ -f /usr/local/bin/lazygit ]; then
        echo "lazygit Installed" >>$log_file
    else
        echo "lazygit FAILED TO INSTALL!!!" >>$log_file
    fi
fi

# Check if lazyvim is installed
if [ -d ~/.config/nvim ]; then
    echo "lazyvim is already installed" >> $log_file
else
    # Install lazyvim
    cd ~/
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
        echo "lazyvim Installed" >>$log_file
    else
        echo "lazyvim FAILED TO INSTALL!!!" >>$log_file
    fi
fi

# Check if starship is installed
if [ -f /usr/local/bin/starship ]; then
    echo "starship is already installed" >> $log_file
else
    # Install starship
    cd ~/
    git clone https://github.com/starship/starship.git --recursive
    cd starship
    cd install
    sh install.sh
    if [ -f /usr/local/bin/starship ]; then
        echo "starship Installed" >>$log_file
    else
        echo "starship FAILED TO INSTALL!!!" >>$log_file
    fi
fi

# Check if nvm is installed
if [ -d ~/.nvm ]; then
    echo "nvm is already installed" >> $log_file
else
    # Install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    source ~/.zshrc
    nvm install --lts
    nvm use --lts
fi

# Check if FZF is installed
if [ -d ~/.fzf ]; then
    echo "FZF is already installed" >> $log_file
else
    # Install fzf
    cd ~/
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# Copy dotfiles
cd ~/
cd dotfiles
cp -R local_dotfiles ~/
cd ~/

# Rename current dotfiles
timestamp=$(date +"%Y%m%d_%H%M")
cd ~/
mv ~/.config/nvim/init.lua{,_$timestamp}
mv ~/.config/nvim/lua{,_$timestamp}
mv ~/.config/starship.toml{,_$timestamp}

# GNU Stow the files
cd ~/local_dotfiles
stow .

# Check if Oh My Zsh is installed
if [ -d ~/.oh-my-zsh ]; then
    echo "Oh My Zsh is already installed" >> $log_file
else
    # Install Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # Install zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

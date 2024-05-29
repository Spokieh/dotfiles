rl -s "hases/latest" | grep -Po '"tag_name": "v\K[^"]\*')

```

```

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

```

```

tar xf lazygit.tar.gz lazygit

```

```

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```


## GNU Stow

```

sudo apt-get install -y stow

```


## zsh-autosuggestions

```

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

```

## zsh-syntax-highlighting

```

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```
## tmux

```

sudo apt-get install tmux

```

## zoxide

```

sudo apt-get install zoxide

```





```

sudo install lazygit /usr/local/bin

```

### Ripgrep

```

sudo apt-get install ripgrep

```

### Fd

```

sudo apt install fd-find

```


### Lazyvim

```

git clone https://github.com/LazyVim/starter ~/.config/nvim

```

```

rm -rf ~/.config/nvim/.git

```

## Starship

```

git clone https://github.com/starship/starship.git --recursive

```

```

cd starship && cd install

```

```

sh install.sh

```


## ZSH

```

sudo apt-get install zsh

```

### oh my zshttps://api.github.com/repos/jesseduffield/lazygit/rele## Content

- vim (Neovim) config
- tmux config
- git config
- zsh
- starship

##  Neovim setup

### Requirements

-   Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
-   Git >= **2.19.0** (for partial clones support)
-   [LazyVim](https://www.lazyvim.org/)
-   a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but needed to display some icons)_**
-   [lazygit](https://github.com/jesseduffield/lazygit) **_(optional)_**
-   a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
-   for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) **_(optional)_**
    -   **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
    -   **find files**: [fd](https://github.com/sharkdp/fd)
-   a terminal that support true color and _undercurl_:
    -   [kitty](https://github.com/kovidgoyal/kitty) **_(Linux & Macos)_**
    -   [wezterm](https://github.com/wez/wezterm) **_(Linux, Macos & Windows)_**
    -   [alacritty](https://github.com/alacritty/alacritty) **_(Linux, Macos & Windows)_**
    -   [iterm2](https://iterm2.com/) **_(Macos)_**
-   [Solarized Osaka](https://github.com/craftzdog/solarized-osaka.nvim)
-
## Neovim install

### Build from source

```

sudo apt-get install ninja-build gettext cmake unzip curl build-essential

```

```

git clone https://github.com/neovim/neovim

```

```

cd neovim

```

```

git checkout stable

```

```

sudo make CMAKE_BUILD_TYPE=RelWithDebInfo

```

```

sudo make install

```



## Lazyvim install

### Lazygit

```

LAZYGIT_VERSION=$(cu

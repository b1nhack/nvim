# 🛸 Nvim

Neovim IDE + Colemak

![nvim](https://github.com/user-attachments/assets/3c63cd78-6dbe-4bd0-9eed-ce4ee0ae823e)

# ⚡️ Requirements

- [Kitty terminal](https://github.com/kovidgoyal/kitty)
- Neovim >= 0.10.0 (needs to be built with LuaJIT)
- Git >= 2.19.0 (for partial clones support)
- A [Nerd Font](https://www.nerdfonts.com) >= 3.0
- A C compiler for nvim-treesitter. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) >= 14 recommended
- [sharkdp/fd](https://github.com/sharkdp/fd)
- [atanunq/viu](https://github.com/atanunq/viu)

# 🚀 Getting Started

- Make a backup of your current Neovim files

  ```sh
  # required
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
  ```

- Clone the repo

  ```sh
  git clone https://github.com/b1nhack/nvim ~/.config/nvim
  ```

- Remove the .git folder, so you can add it to your own repo later

  ```sh
  rm -rf ~/.config/nvim/.git
  ```

- Start Neovim

  ```sh
  nvim
  ```

  Waiting for initialization to complete.

- Check if everything is working correctly

  ```sh
  :checkhealth
  ```

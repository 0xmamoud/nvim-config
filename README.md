
# Neovim config

a simple Neovim config built on top of nvchad for C/CPP and web development (preter, eslint, tailwind-css, ts...).

## Installation

Install nvchad v2.0 and clone this repository in the lua folder
```bash
  git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
  cd ~/.config/nvim/lua
  git clone https://github.com/0xmamoud/nvim-config custom
```

Don't forgot to run mason to install all languages server
```bash
  MasonInstallAll
```

for C/CPP auto suggestion, run 
```bash
  TSIntall cpp
```

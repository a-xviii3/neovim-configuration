# My Neovim Configuration

## Preview
![image](https://github.com/user-attachments/assets/45cc919d-36a0-4b6c-bf1c-1f8f33d9eae4)

## Description
A complete and personalised neovim configuration/distro but functional enough to be used by anyone.

## Features
* Support for all dev tools including lsps, formatters, linters and debuggers
* Quick Settings (`<leader>op`) for easy setup of tools
* Very handy keymaps which are labelled so that they can be easily searched for (try `<leader>fk`)
* File explorer using neovim-inbuilt netrw extension
* Simple and clean statusline without using external plugins
* Fuzzy finding (telescope), quick buffer switching (harpoon), treesitter (syntax highlighting)
* A very user friendly lsp experience (lspsaga)
* And many quality of life features

## Requirements
* Nerd Font
* Neovim 0.10+ (stable)
* Treesitter-CLI (for auto_install feature)
* Terminal with true color support (for colorscheme)
* RipGrep

## Installation
* Locate your config directory (try command `:lua print(vim.fn.stdpath("config"))`
* Clone this repository in that directory
* Run neovim to let all the plugins setup
* Close and re-run neovim
* Change and configuration or settings

## Basic Setup
Pressing the `<leader>op` keymaps opens the quick settings file in a pop-up buffer. The file is well-documented to help you make changes.  
In this file you can add more pluins, do setup stuff and install and set up dev tools (lsps, formatters, linters, daps).  
  
You can also edit the config in and out of itself which is modular and, for the most part, simple.

## Config File Structure
Kinda went haywire with this xD
```
~/.config/nvim
├── lua
│   └── config
│       ├── base                               <-- base neovim or default stuff
│       │   ├── keymaps.lua                    <-- keymaps or remaps for base neovim command or keymaps
│       │   ├── options.lua                    <-- settings base neovim options
│       │   └── quick_settings.lua             <-- default quick settings
│       ├── custom                             <-- custom stuff which are still made using core neovim functionality
│       │   ├── autocommands.lua               <-- custom autocommands for different stuff
│       │   ├── keymaps.lua                    <-- keymaps with custom functionality made using core neovim functions
│       │   ├── statusline.lua                 <-- custom statusline
│       │   └── [ quick_settings.lua ]
│       ├── plugins                            <-- everything related to plugins
│       │   ├── aesthetics
│       │   │   ├── dressing.lua               <-- better ui for vim.ui.input and vim.ui.select
│       │   │   ├── netrw_plus.lua             <-- add devicons to netrw
│       │   │   └── onedark.lua                <-- colorscheme
│       │   ├── dependencies
│       │   │   ├── devicons.lua               <-- icons used by different plugins
│       │   │   ├── nio.lua                    <-- async io for neovim
│       │   │   └── plenary.lua                <-- helper and utlity neovim functions
│       │   ├── dev_tools
│       │   │   ├── cmp.lua                    <-- completion setup
│       │   │   ├── conform.lua                <-- formatters
│       │   │   ├── dap.lua                    <-- debug adapter
│       │   │   ├── dap_ui.lua                 <-- ui for debug adapter
│       │   │   ├── lazydev.lua                <-- setup for lua_ls and nvim api
│       │   │   ├── lint.lua                   <-- linters
│       │   │   ├── lspconfig.lua              <-- configuring lsps
│       │   │   ├── lspsaga.lua                <-- improvements to the lsp experience
│       │   │   ├── luasnip.lua                <-- snippet engine
│       │   │   ├── mason.lua                  <-- package manager for different tools
│       │   │   ├── mason_dap.lua              <-- bridge mason and dap
│       │   │   ├── mason_lspconfig.lua        <-- bridge mason and lspconfig
│       │   │   └── mason_tool_installer.lua   <-- install other tools available in mason
│       │   ├── essentials
│       │   │   ├── harpoon.lua                <-- quick buffer switching
│       │   │   ├── telescope.lua              <-- fuzzy finder and picker
│       │   │   └── treesitter.lua             <-- syntax highlighting and other cool stuff
│       │   ├── quality_of_life
│       │   │   ├── cloak.lua                  <-- hides sensitive tokens and stuff
│       │   │   ├── color_picker.lua           <-- color picker and highlighter
│       │   │   ├── comment.lua                <-- quick commenting
│       │   │   ├── context.lua                <-- context of the line under cursor
│       │   │   ├── guess_indent.lua           <-- set buffer-local indentation depending on open file
│       │   │   ├── todo_comments.lua          <-- highlighting on special comment tags
│       │   │   ├── trouble.lua                <-- pretty ui for diagnostics, quick_fix, etc
│       │   │   └── undotree.lua               <-- undo history in a tree format
│       │   └── manager.lua                    <-- bootstrap and load the plugin manager
│       └── init.lua                           <-- pre-config and gateway to other config elements
└── init.lua
```

## Screenshots
Ignore the statusline at the absolute bottom (that's from tmux)
![image](https://github.com/user-attachments/assets/ac99bab8-06af-4449-ad0f-d225e2857d3e)
![image](https://github.com/user-attachments/assets/7a2b068f-7b83-4c02-b2b1-d8e0b57a6198)
![image](https://github.com/user-attachments/assets/2a9d8284-07f4-4a61-8746-48ac477316bd)
![image](https://github.com/user-attachments/assets/4068b486-b03a-4c43-b128-87dfe780937f)
![image](https://github.com/user-attachments/assets/77e1423b-c6ab-46be-b0ac-c656f5c7aee5)
![image](https://github.com/user-attachments/assets/9e5fb51e-b01e-432d-b058-c9c83911d9d3)
![image](https://github.com/user-attachments/assets/2beaf62c-e767-4811-a877-935a2a12d32b)
![image](https://github.com/user-attachments/assets/fe802212-5081-4972-bab9-5b47efd7c86c)





--[[ make initial preparations and call other components ]]

-- make quick settings global
Quick_Settings = require("config.base.quick_settings")
if pcall(require, "config.custom.quick_settings") then
	Quick_Settings = require("config.custom.quick_settings")
end

-- create augroup for custom autocommands
CUSTOM_AUGROUP = vim.api.nvim_create_augroup("custom_augroup", { clear = true })

-- keymap commands for easy access
Keymap = vim.keymap.set
NKeymap = function(...) Keymap("n", ...) end

-- set default colorscheme to "habamax" incase installed ones couldn't be run
vim.cmd.colorscheme("habamax")

--[[ NOTE: distinction between base, custom and plugin modules
--         * base module deals with base neovim or default stuff
--         * custom module deals with custom stuff which are still made using core neovim functionality
--         * plugin module deals with everything related to plugins ]]

-- initalize other config components
require("config.base.options")
require("config.base.keymaps")
require("config.custom.keymaps")
require("config.custom.autocommands")
require("config.custom.statusline")
require("config.plugin.manager")

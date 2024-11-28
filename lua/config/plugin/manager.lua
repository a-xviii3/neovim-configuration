--[[ bootstrap and initialize lazy.nvim package manager ]]

-- download lazy if not already installed and add to runtime path
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- definitely not a undefined field
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
	local git_clone_output = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazy_path,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ git_clone_output, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazy_path)

-- setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "config.plugin.dependencies" },
		{ import = "config.plugin.dev_tools" },
		{ import = "config.plugin.essentials" },
		{ import = "config.plugin.quality_of_life" },
		{ import = "config.plugin.aesthetics" },
		Quick_Settings.plugins,
	},
	rocks = { enabled = false }, -- disable lua rocks support as we don't use it
	install = { colorscheme = { "onedark", "habamax" } },
	checker = { enabled = true, notify = false }, -- check for updates but don't notify
	change_detection = { enabled = true, notify = false }, -- check for changes but dont't notify
})

NKeymap("<leader>lz", "<cmd>Lazy<CR>", { desc = "plugins/lazy: open the lazy window" })

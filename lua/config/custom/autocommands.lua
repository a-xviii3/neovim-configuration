--[[ custom autocommands ]]

local create_aucmd = vim.api.nvim_create_autocmd

-- disable color column in some file types
create_aucmd("FileType", {
	group = CUSTOM_AUGROUP,
	pattern = { "netrw", "help" },
	callback = function()
		vim.opt_local.colorcolumn = "0"
		vim.opt_local.statuscolumn = "%s "
		vim.opt_local.statusline = nil
	end,
})

-- highlight text after yank
create_aucmd("TextYankPost", {
	group = CUSTOM_AUGROUP,
	callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 }) end,
})

-- enable relative line numbers
create_aucmd({ "WinEnter", "FocusGained", "BufReadPre", "FileReadPre" }, {
	group = CUSTOM_AUGROUP,
	callback = function()
		if vim.bo.filetype == "netrw" then
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
			return
		end

		vim.opt_local.number = true
		vim.opt_local.relativenumber = true
	end,
})
create_aucmd({ "WinLeave", "FocusLost" }, {
	group = CUSTOM_AUGROUP,
	callback = function()
		if vim.bo.filetype == "netrw" then
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
			return
		end

		vim.opt_local.number = true
		vim.opt_local.relativenumber = false
	end,
})

-- set the leadmultispace value correctly on file load or focus
create_aucmd({ "WinEnter", "BufEnter" }, {
	group = CUSTOM_AUGROUP,
	callback = function()
		vim.opt.listchars:append({
			leadmultispace = "▎" .. ("∙"):rep(vim.opt_local.tabstop._value - 1),
		})
	end,
})

-- anything the user wants to execute when the config is ready
create_aucmd("VimEnter", {
	group = CUSTOM_AUGROUP,
	callback = function() Quick_Settings.after() end,
})

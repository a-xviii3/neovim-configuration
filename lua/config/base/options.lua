--[[ set up options available in core neovim ]]

-- status column
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number" -- show useful signs like errors, warnings, notes, etc in the number column

-- code folding
vim.opt.foldmethod = "manual"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 999 -- folds at a level of nesting higher than this will be closed
vim.opt.foldlevelstart = 999 -- same as above but set when editing a buffer
vim.opt.foldnestmax = 9

-- text wrapping
vim.opt.wrap = false
vim.opt.textwidth = 0
vim.opt.colorcolumn = "81,121"

-- cursor movement wrapping
vim.opt.whichwrap:append("h")
vim.opt.whichwrap:append("l")

-- indent formatiing
vim.opt.expandtab = false
vim.opt.tabstop = 6 -- number of spaces a tab is equivalent to (? in normal mode ?)
vim.opt.shiftwidth = 0 -- number of spaces in each level of indentation (0 sets it to tabstop)
vim.opt.softtabstop = -1 -- number of spaces in a tab (? while editing text ?) (shiftwidth when negative)
vim.opt.autoindent = true -- auto indent new lines based on current line
vim.opt.smartindent = true -- smart indent lines based on context

-- editor options
vim.opt.updatetime = 250
vim.opt.cursorline = true -- highlight the lines where the cursor is
vim.opt.termguicolors = true -- 24 bit colors
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showmode = false -- don't show current mode in command line
vim.opt.scrolloff = 7
vim.opt.ruler = false
vim.opt.list = true -- render invisible characters
local listchars = {
	{ lead = "∙" },
	-- vim.opt.tabstop returns a table instead of the required value
	---@diagnostic disable-next-line: undefined-field
	{ leadmultispace = "▎" .. ("∙"):rep(vim.opt.tabstop._value - 1) },
	{ tab = "▎ " },
	{ trail = "!" },
	{ extends = "‥" },
	{ precedes = "‥" },
}
for _, value in ipairs(listchars) do
	vim.opt.listchars:append(value)
end

-- other core tooling options
vim.opt.ignorecase = true -- ignore case while searching
vim.opt.smartcase = true -- ignore case when searching in lowercase
vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
vim.opt.inccommand = "split" -- preview searches/substitutions live and show off screen ones in seperate popup
vim.opt.wrapscan = true
vim.g.netrw_winsize = 20
vim.opt.jumpoptions = "stack,view" -- makes jumping around more consistent https://www.reddit.com/r/neovim/comments/1cytkbq/comment/l7cqdmq

-- backup and undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

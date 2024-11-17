--[[ keymaps that remap or map core/base neovim keymaps or commands ]]

vim.g.mapleader = " "
vim.g.maplocalleader = "//"

-- open the messages window
NKeymap("<leader>ms", "<cmd>messages<CR>", { desc = "core/base: open messages window" })

-- moving text
-- NOTE: using "<cmd>" instead of ":" break theses commands
NKeymap("<M-j>", "v:m '>+1<CR>gv=<ESC>", { desc = "core/base: move the current line up" })
NKeymap("<M-k>", "v:m '<-2<CR>gv=<ESC>", { desc = "core/base: move the current line down" })
Keymap("v", "<M-j>", ":m '>+1<CR>gv=<ESC>gv", { desc = "core/base: move the current selection up" })
Keymap(
	"v",
	"<M-k>",
	":m '<-2<CR>gv=<ESC>gv",
	{ desc = "core/base: move the current selection down" }
)

-- stationary cursor
NKeymap("J", "mzJ`z", { desc = "core/base: don't move the cursor when joining the next line" })
NKeymap(
	"<C-d>",
	"<C-d>zz",
	{ desc = "core/base: keep the cursor at the center when scrolling down" }
)
NKeymap("<C-u>", "<C-u>zz", { desc = "core/base: keep the cursor at the center when scrolling up" })
NKeymap(
	"n",
	"nzzzv",
	{ desc = "core/base: keep the cursor centered while navigating search results" }
)
NKeymap(
	"N",
	"Nzzv",
	{ desc = "core/base: keep the cursor centered while navigating search results" }
)

-- modification/extensions of existing keymaps
Keymap(
	{ "n", "v" },
	"x",
	"\"_x",
	{ desc = "core/base: remove character or selection without copying" }
)
Keymap("x", "<leader>p", "\"_dP", { desc = "core/base: paste over selection without copying" })
Keymap({ "n", "v" }, "<leader>y", "\"+y", { desc = "core/base: yank to system clipboard" })
NKeymap("<leader>Y", "\"+Y", { desc = "core/base: yank till end of line to system clipboard" })
Keymap({ "n", "v" }, "<leader>d", "\"_d", { desc = "core/base: delete without copying" })
NKeymap("<leader>D", "\"_D", { desc = "core/base: delete till end of line without copying" })
Keymap({ "n", "v" }, "<leader>c", "\"_c", { desc = "core/base: delete and edit without copying" })
NKeymap(
	"<leader>C",
	"\"_C",
	{ desc = "core/base: delete till end of line and edit without copying" }
)

-- split resizing
NKeymap("-", "<cmd>wincmd <<CR>", { desc = "core/base: increase window width" })
NKeymap("+", "<cmd>wincmd ><CR>", { desc = "core/base: decrease window width" })
NKeymap("<leader>+", "<cmd>wincmd +<CR>", { desc = "core/base: increase window height" })
NKeymap("<leader>-", "<cmd>wincmd -<CR>", { desc = "core/base: decrease window height" })

-- quick fix list
NKeymap("<leader>q", "<cmd>copen<CR>", { desc = "core/base: open the quick fix list" })
NKeymap("<leader>Q", "<cmd>ccl<CR>", { desc = "core/base: close the quick fix list" })
NKeymap("]q", "<cmd>cnext<CR>", { desc = "core/base: walk forward in the quick fix list" })
NKeymap("[q", "<cmd>cprev<CR>", { desc = "core/base: walk backward the quick fix list" })

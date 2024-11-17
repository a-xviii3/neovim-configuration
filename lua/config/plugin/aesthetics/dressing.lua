--[[ better vim.ui.select and vim.ui.input ]]

return {
	"stevearc/dressing.nvim",
	name = "dressing",
	config = function() require("dressing").setup({ input = { relative = "editor" } }) end,
}

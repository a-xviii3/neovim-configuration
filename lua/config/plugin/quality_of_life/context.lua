--[[ shows the context of the line on which the cursor is ]]

return {
	"nvim-treesitter/nvim-treesitter-context",
	name = "context",
	config = function() require("treesitter-context").setup({ multiline_threshold = 7 }) end,
}

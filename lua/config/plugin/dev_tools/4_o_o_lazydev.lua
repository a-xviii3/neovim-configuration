--[[ proper configuration of luals ]]

return {
	"folke/lazydev.nvim",
	name = "lazydev",
	dependencies = { "lspconfig" },
	config = function() require("lazydev").setup() end,
}

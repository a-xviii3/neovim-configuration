--[[ icons used by different plugins ]]

return {
	"nvim-tree/nvim-web-devicons",
	name = "devicons",
	priority = 500,
	config = function() require("nvim-web-devicons").setup() end,
}

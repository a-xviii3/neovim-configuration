--[[ minor enhancements to netrw ]]

return {
	"prichrd/netrw.nvim",
	name = "netrw",
	dependencies = { "devicons" },
	config = function() require("netrw").setup({ use_devicons = true }) end,
}

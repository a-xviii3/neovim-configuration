--[[ undo history in a tree format ]]

return {
	"mbbill/undotree",
	name = "undotree",
	config = function()
		NKeymap(
			"<leader>u",
			"<cmd>UndotreeToggle<CR>",
			{ desc = "plugins/undotree: toggle the undo history tree" }
		)
	end,
}

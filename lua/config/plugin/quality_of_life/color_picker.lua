--[[ color picker ]]

return {
	"uga-rosa/ccc.nvim",
	name = "color_picker",
	config = function()
		require("ccc").setup()

		NKeymap(
			"<leader>cp",
			"<cmd>CccPick<CR>",
			{ desc = "plugins/colorpicker: pick a color" }
		)
		NKeymap(
			"<leader>ch",
			"<cmd>CccHighlighterToggle<CR>",
			{ desc = "plugins/colorpicker: toggle color highlighting" }
		)
		NKeymap(
			"<leader>cc",
			"<cmd>CccConvert<CR>",
			{ desc = "plugins/colorpicker: convert color into other forms" }
		)
	end,
}

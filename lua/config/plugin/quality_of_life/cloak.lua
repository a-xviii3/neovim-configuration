--[[ hide sensitive tokens, just in case ]]

return {
	"laytan/cloak.nvim",
	name = "cloak",
	config = function()
		require("cloak").setup({
			cloak_character = "?",
			patterns = Quick_Settings.cloak_patterns,
		})

		NKeymap(
			"<leader>ct",
			"<cmd>CloakToggle",
			{ desc = "plugins/cloak: toggle cloak hiding" }
		)
		NKeymap(
			"<leader>cl",
			"<cmd>CloakPreviewLine",
			{ desc = "plugins/cloak: preview the current line" }
		)
	end,
}

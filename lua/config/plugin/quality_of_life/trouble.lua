--[[ pretty list for showing a lot of stuff ]]

return {
	"folke/trouble.nvim",
	name = "trouble",
	config = function()
		require("trouble").setup()

		NKeymap(
			"<leader>td",
			"<cmd>Trouble diagnostics toggle<CR>",
			{ desc = "plugins/trouble: open project wide trouble diagnostics" }
		)
		NKeymap(
			"<leader>tb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			{ desc = "plugins/trouble: open trouble diagnostics for current buffer" }
		)

		NKeymap(
			"<leader>tq",
			"<cmd>Trouble qflist toggle<CR>",
			{ desc = "plugins/trouble: open quick fix list in troubl" }
		)
		NKeymap(
			"<leader>tl",
			"<cmd>Trouble loclist toggle<CR>",
			{ desc = "plugins/trouble: open location fix list in troubl" }
		)
	end,
}

--[[ improvements to nvim's lsp experience ]]

return {
	"nvimdev/lspsaga.nvim",
	name = "lspsaga",
	dependencies = { "treesitter", "devicons", "lspconfig" },
	config = function()
		require("lspsaga").setup()

		NKeymap(
			"<leader>ca",
			"<cmd>Lspsaga code_action<CR>",
			{ desc = "plugins/lspsaga: open code actions for diagnostics under cursor" }
		)
		NKeymap(
			"gd",
			"<cmd>Lspsaga goto_definition<CR>",
			{ desc = "plugins/lspsaga: goto the definition of the term under cursor" }
		)
		NKeymap(
			"gt",
			"<cmd>Lspsaga goto_type_definition<CR>",
			{ desc = "plugins/lspsaga: goto the type definition of the term under cursor" }
		)
		NKeymap(
			"gp",
			"<cmd>Lspsaga peek_definition<CR>",
			{ desc = "plugins/lspsaga: peek the definition of the term under cursor" }
		)
		NKeymap(
			"gP",
			"<cmd>Lspsaga peek_type_definition<CR>",
			{ desc = "plugins/lspsaga: peek the type definition of the term under cursor" }
		)
		NKeymap(
			"]d",
			"<cmd>Lspsaga diagnostic_jump_next<CR>",
			{ desc = "plugins/lspsaga: jump to the next diagnostic" }
		)
		NKeymap(
			"[d",
			"<cmd>Lspsaga diagnostic_jump_prev<CR>",
			{ desc = "plugins/lspsaga: jump to the previous diagnostic" }
		)
		Keymap(
			{ "n", "t" },
			"<leader>tr",
			"<cmd>Lspsaga term_toggle<CR>",
			{ desc = "plugins/lspsaga: toggle terminal" }
		)
		NKeymap(
			"K",
			"<cmd>Lspsaga hover_doc<CR>",
			{ desc = "plugins/lspsaga: show the docs for the term under the cursor" }
		)
		NKeymap(
			"<C-k>",
			"<cmd>Lspsaga hover_doc<CR>",
			{ desc = "plugins/lspsaga: show the docs for the term under the cursor" }
		)
		NKeymap(
			"<leader>rn",
			"<cmd>Lspsaga rename<CR>",
			{ desc = "plugins/lspsaga: rename term under cursor using lsp" }
		)
	end,
}

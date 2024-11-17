--[[ fuzzy finder and picker ]]

return {
	"nvim-telescope/telescope.nvim",
	name = "telescope",
	branch = "0.1.x",
	dependencies = { "plenary", "devicons" },
	config = function()
		require("telescope").setup({
			picker = { buffers = { initial_mode = "normal" } },
		})

		local telescope_builtin = require("telescope.builtin")

		NKeymap(
			"<leader>/",
			telescope_builtin.current_buffer_fuzzy_find,
			{ desc = "plugins/telescope: fuzzy find through current buffer" }
		)
		NKeymap(
			"<leader>ff",
			telescope_builtin.find_files,
			{ desc = "plugins/telescope: fuzzy find through project files" }
		)
		NKeymap(
			"<leader>fh",
			telescope_builtin.help_tags,
			{ desc = "plugins/telescope: fuzzy find through neovim help tags" }
		)
		NKeymap(
			"<leader>fn",
			function() telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") }) end,
			{ desc = "plugins/telescope: fuzzy find through neovim config files" }
		)
		NKeymap(
			"<leader>fo",
			telescope_builtin.oldfiles,
			{ desc = "plugins/telescope: fuzzy find through recent files" }
		)
		NKeymap(
			"<leader>fk",
			telescope_builtin.keymaps,
			{ desc = "plugins/telescope: fuzzy find through all keymaps" }
		)
		NKeymap(
			"<leader>fg",
			telescope_builtin.live_grep,
			{ desc = "plugins/telescope: fuzzy find through grep results live" }
		)
		NKeymap(
			"<leader>fr",
			telescope_builtin.registers,
			{ desc = "plugins/telescope: fuzzy find through vim registers" }
		)
		NKeymap(
			"<leader>fb",
			telescope_builtin.buffers,
			{ desc = "plugins/telescope: fuzzy find through all open buffers" }
		)
		NKeymap(
			"<leader>fc",
			telescope_builtin.commands,
			{ desc = "plugins/telescope: fuzzy find through all commands" }
		)
		NKeymap("gr", require("telescope.builtin").lsp_references, {
			desc = "plugins/telescope: fuzzy find through the references of the word under cursor",
		})
		NKeymap("gI", require("telescope.builtin").lsp_implementations, {
			desc = "plugins/telescope: fuzzy find throught the implemtations of word under cursor",
		})
	end,
}

--[[ better inline diagnostics ]]

return {
	"rachartier/tiny-inline-diagnostic.nvim",
	name = "tiny_inline_diagnostics",
	priority = 500,
	config = function()
		vim.diagnostic.config({ virtual_text = false }) -- disable vim diagnostics first

		local tiny = require("tiny-inline-diagnostic")
		tiny.setup({
			options = {
				multilines = true,
				overflow = { mode = "wrap" },
			},
		})

		NKeymap(
			"<leader>tt",
			tiny.toggle,
			{ desc = "plugins/tiny_inline_diagnostics: toggle tiny diagnostics" }
		)
	end,
}

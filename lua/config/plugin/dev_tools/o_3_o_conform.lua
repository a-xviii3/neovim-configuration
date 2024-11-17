--[[ formatter ]]

return {
	"stevearc/conform.nvim",
	name = "conform",
	dependencies = { "mason_tool_installer" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = Quick_Settings.formatters,
			formatters = Quick_Settings.custom_formatters,
			format_on_save = { lsp_format = "fallback", timeout_ms = 500 },
		})

		Keymap(
			{ "n", "v" },
			"<leader>fm",
			function() conform.format({ lsp_format = "fallback", timeout_ms = 500 }) end,
			{ desc = "plugins/conform: format the file or selection" }
		)
	end,
}

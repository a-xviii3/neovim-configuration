--[[ linter support ]]

return {
	"mfussenegger/nvim-lint",
	name = "lint",
	dependencies = { "mason_tool_installer" },
	config = function()
		local lint = require("lint")

		Quick_Settings.linters.mason = nil
		lint.linters_by_ft = Quick_Settings.linters
		lint.linters = Quick_Settings.custom_linters

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = CUSTOM_AUGROUP,
			callback = function() lint.try_lint() end,
		})

		NKeymap(
			"<leader>ln",
			function() lint.try_list() end,
			{ desc = "plugins/conform: perform linting in the current file" }
		)
	end,
}

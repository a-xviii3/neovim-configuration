--[[ install and upgrade any and all mason tools ]]

return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	name = "mason_tool_installer",
	dependencies = { "mason" },
	config = function()
		local ensure_installed_tools = {}

		if Quick_Settings.formatters.mason then
			for _, formatter_name in pairs(Quick_Settings.formatters.mason) do
				table.insert(ensure_installed_tools, formatter_name)
			end
		end

		if Quick_Settings.linters.mason then
			for _, linter_name in ipairs(Quick_Settings.linters.mason) do
				table.insert(ensure_installed_tools, linter_name)
			end
		end

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed_tools,
			integrations = {
				["mason-lspconfig"] = false,
				["mason-null-ls"] = false,
				["mason-nvim-dap"] = false,
			},
		})
	end,
}

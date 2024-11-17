--[[ install and setup lsps by bridging mason and lspconfig ]]

return {
	"williamboman/mason-lspconfig.nvim",
	name = "mason_lspconfig",
	dependencies = { "mason" },
	config = function()
		local ensure_installed_lsps = {}

		for lsp_name, _ in pairs(Quick_Settings.lsps) do
			table.insert(ensure_installed_lsps, lsp_name)
		end

		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed_lsps,
			automatic_installation = true,
		})
	end,
}

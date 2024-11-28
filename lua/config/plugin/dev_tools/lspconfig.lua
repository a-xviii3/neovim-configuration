--[[ configurations for different lsps ]]

return {
	"neovim/nvim-lspconfig",
	name = "lspconfig",
	dependencies = {
		"mason_lspconfig",
		{ "hrsh7th/cmp-nvim-lsp", name = "cmp_lsp" },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)

		for lsp_name, opts in pairs(Quick_Settings.lsps) do
			opts.capabilities = vim.tbl_deep_extend("force", capabilities, opts.capabilities)
			lspconfig[lsp_name].setup(opts)
		end
	end,
}

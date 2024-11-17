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

		for lsp_name, opts in pairs(Quick_Settings.lsps) do
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			opts.capabilities = cmp_nvim_lsp.default_capabilities()
			lspconfig[lsp_name].setup(opts)
		end
	end,
}

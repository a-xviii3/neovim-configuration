--[[ better parsing and syntax trees ]]

return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	build = ":TSUpdate",
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin) -- some plugins use treesitter stuff but do not explicitly load treesitter so we add it to rtp so that it is avialble to anything that needs it
		require("nvim-treesitter.query_predicates") -- avoids any loading issues by already loading the predicates
		require("nvim-treesitter.install").prefer_git = true -- prefer parser installations via git
	end,
	config = function()
		-- missing fields not necessary for this config
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "vimdoc", "comment", "markdown", "markdown_inline" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})

		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
}

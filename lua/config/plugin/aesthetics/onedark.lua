--[[ editor colorscheme of choice ]]

return {
	"navarasu/onedark.nvim",
	name = "onedark",
	config = function()
		require("onedark").setup({
			transparent = true, -- show/hide background
			term_colors = true, -- change terminal color as per the selected theme style
			ending_tildes = true, -- show the end-of-buffer tildes. by default they are hidden
			cmp_itemkind_reverse = true, -- reverse item kind highlights in cmp menu

			highlights = {
				["StatusLine"] = { bg = "none" },
				["StatusLineNC"] = { bg = "none" },
				["StatusLineTerm"] = { bg = "none" },
				["StatusLineTermNC"] = { bg = "none" },
			},
		})
		require("onedark").load()
	end,
}

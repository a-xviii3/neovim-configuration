--[[ package manager for dev tools ]]

return {
	"williamboman/mason.nvim",
	name = "mason",
	config = function()
		require("mason").setup()

		NKeymap("<leader>mn", "<cmd>Mason<CR>", { desc = "plugins/mason: open mason" })
	end,
}

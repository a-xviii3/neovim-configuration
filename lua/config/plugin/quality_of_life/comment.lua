--[[ quick comment ]]

return {
	"numToStr/Comment.nvim",
	name = "comment",
	config = function()
		-- missing fields not required for this config
		---@diagnostic disable-next-line: missing-fields
		require("Comment").setup({
			mappings = { basic = false, extra = false },
		})

		NKeymap(
			"<C-c>",
			"<Plug>(comment_toggle_linewise)",
			{ desc = "plugins/comment: leader for linewise commenting motions" }
		)
		NKeymap(
			"<C-x>",
			"<Plug>(comment_toggle_blockwise)",
			{ desc = "plugins/comment: leader for blockwise commenting motions" }
		)

		NKeymap(
			"<C-c><C-c>",
			function()
				return vim.api.nvim_get_vvar("count") == 0
						and "<plug>(comment_toggle_linewise_current)"
					or "<plug>(comment_toggle_linewise_count)"
			end,
			{
				expr = true,
				desc = "plugins/comment: toggle single line commenting of the line",
			}
		)
		NKeymap(
			"<C-x><C-x>",
			function()
				return vim.api.nvim_get_vvar("count") == 0
						and "<plug>(comment_toggle_blockwise_current)"
					or "<plug>(comment_toggle_blockwise_count)"
			end,
			{ expr = true, desc = "plugins/comment: toggle block commenting of the line" }
		)

		Keymap(
			"x",
			"<C-c><C-c>",
			"<Plug>(comment_toggle_linewise_visual)",
			{ desc = "plugins/comment: toggle single line commenting selection" }
		)
		Keymap(
			"x",
			"<C-x><C-x>",
			"<Plug>(comment_toggle_blockwise_visual)",
			{ desc = "plugins/comment: toggle block commenting selection" }
		)
	end,
}

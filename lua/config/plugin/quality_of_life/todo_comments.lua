--[[ highlighting for special comment tags ]]

return {
	"folke/todo-comments.nvim",
	name = "todo_comments",
	dependencies = { "plenary", "telescope" },
	config = function()
		require("todo-comments").setup()

		NKeymap(
			"]t",
			function() require("todo-comments").jump_next() end,
			{ desc = "plugins/todocomments: jump to the next todo comment" }
		)
		NKeymap(
			"[t",
			function() require("todo-comments").jump_prev() end,
			{ desc = "plugins/todocomments: jump to the previous todo comment" }
		)
		NKeymap(
			"tl",
			"<cmd>TodoQuickFix<CR>",
			{
				desc = "plugins/todocomments: show all todo comments in project quick fix list",
			}
		)
	end,
}

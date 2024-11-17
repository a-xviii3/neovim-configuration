--[[ quick buffer switches as substitute for tab bar ]]

return {
	"ThePrimeagen/Harpoon",
	name = "harpoon",
	dependencies = { "plenary" },
	config = function()
		local harpoon = require("harpoon")

		harpoon.setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		NKeymap(
			"<leader>ht",
			function() harpoon.ui:toogle_quick_menu(harpoon:list()) end,
			{ desc = "plugins/harpoon: open harpoon file list" }
		)
		NKeymap(
			"<leader>ha",
			function() harpoon:list():add() end,
			{ desc = "plugins/harpoon: add open file to harpoon list" }
		)

		NKeymap(
			"<leader>1",
			function() harpoon:list():select(1) end,
			{ desc = "plugins/harpoon: go to the first file in harpoon list" }
		)
		NKeymap(
			"<leader>2",
			function() harpoon:list():select(2) end,
			{ desc = "plugins/harpoon: go to the second file in harpoon list" }
		)
		NKeymap(
			"<leader>3",
			function() harpoon:list():select(3) end,
			{ desc = "plugins/harpoon: go to the third file in harpoon list" }
		)
		NKeymap(
			"<leader>4",
			function() harpoon:list():select(4) end,
			{ desc = "plugins/harpoon: go to the fourth file in harpoon list" }
		)
		NKeymap(
			"<leader>5",
			function() harpoon:list():select(5) end,
			{ desc = "plugins/harpoon: go to the fifth file in harpoon list" }
		)

		NKeymap(
			"]h",
			function() harpoon:list():next() end,
			{ desc = "plugins/harpoon: go to the next file in harpoon list" }
		)
		NKeymap(
			"[h",
			function() harpoon:list():prev() end,
			{ desc = "plugins/harpoon: go to the previous file in harpoon list" }
		)
	end,
}

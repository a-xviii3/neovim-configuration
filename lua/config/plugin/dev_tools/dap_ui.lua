--[[ ui for debugging ]]

return {
	"rcarriga/nvim-dap-ui",
	name = "dap_ui",
	dependencies = {
		"dap",
		"nio",
		{ "theHamsta/nvim-dap-virtual-text", name = "dap_virtual_text" },
		{
			"LiadOz/nvim-dap-repl-highlights",
			name = "dap_repl_highlights",
			dependencies = { "treesitter" },
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		require("nvim-dap-virtual-text").setup({
			-- hides and sensitive tokens... just in case
			display_callback = function(variable)
				local name = string.lower(variable.name)
				local value = string.lower(variable.value)

				if
					name:match("secret")
					or name:match("api")
					or value:match("secret")
					or value:match("api")
				then
					return " ******"
				end

				if #variable.value > 15 then
					return " " .. string.sub(variable.value, 1, 15) .. "... "
				end

				return " " .. variable.value
			end,
		})

		dap.listeners.before.attach.dapui_config = function() dapui.open() end
		dap.listeners.before.launch.dapui_config = function() dapui.open() end
		dap.listeners.before.event_terminated.dapui_config = function() dapui.open() end
		dap.listeners.before.event_exited.dapui_config = function() dapui.open() end

		NKeymap("<leader>dt", dapui.toggle, { desc = "plugins/dapui: toggle the dap ui" })
		NKeymap(
			"<leader>dr",
			function() dapui.open({ reset = true }) end,
			{ desc = "plugins/dapui: reset the dap ui" }
		)
	end,
}

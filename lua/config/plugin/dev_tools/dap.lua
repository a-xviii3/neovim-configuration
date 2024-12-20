--[[ debug adapter protocol ]]

return {
	"mfussenegger/nvim-dap",
	name = "dap",
	dependencies = { "mason" },
	config = function()
		local dap = require("dap")

		NKeymap("<F1>", dap.toggle_breakpoint, { desc = "plugins/dap: toggle breakpoint" })
		NKeymap(
			"<F2>",
			function() dap.set_breakpoint(vim.fn.input("Breakpoint Condition: ")) end,
			{ desc = "plugins/dap: set a conditional breakpoint" }
		)
		NKeymap(
			"<F3>",
			function() dap.set_breakpoint(nil, nil, vim.fn.input("Log Point Message: ")) end,
			{ desc = "plugins/dap: set a breakpoint with a log message" }
		)
		NKeymap(
			"<F4>",
			dap.run_to_cursor,
			{ desc = "plugins/dap: run till the line containing the cursor" }
		)

		NKeymap(
			"<F5>",
			function() require("dap.ui").eval(nil, { enter = true }) end,
			{ desc = "plugins/dap: evaluate the variable under the cursor" }
		)

		NKeymap("<leader>dr", dap.restart, { desc = "plugins/dap: restart" })
		NKeymap("F6", dap.continue, { desc = "plugins/dap: continue" })
		NKeymap("F7", dap.step_into, { desc = "plugins/dap: step into" })
		NKeymap("F8", dap.step_over, { desc = "plugins/dap: step over" })
		NKeymap("F9", dap.step_out, { desc = "plugins/dap: step out" })
		NKeymap("F10", dap.step_back, { desc = "plugins/dap: step back" })
	end,
}

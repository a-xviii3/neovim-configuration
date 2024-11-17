--[[ install and configure daps by bridging nvim-dap and mason ]]

return {
	"jay-babu/mason-nvim-dap.nvim",
	name = "mason_dap",
	dependencies = { "dap" },
	config = function()
		local ensure_installed_daps = {}
		local handlers = {
			function(config) require("mason-nvim-dap").default_setup(config) end,
		}

		for dap_name, handler in pairs(Quick_Settings.daps) do
			table.insert(ensure_installed_daps, dap_name)

			if handler then handlers[dap_name] = handler end
		end

		require("mason-nvim-dap").setup({
			ensure_installed = ensure_installed_daps,
			automatic_installation = true,
			handlers = handlers,
		})

		-- just to make sure that mason's setup finished first
		vim.defer_fn(function()
			local dap = require("dap")

			for _, dap_setup in ipairs(Quick_Settings.dap_other) do
				local index = 1
				for name, opts in pairs(dap_setup) do
					if index == 1 then
						dap.adapters[name] = opts
					elseif index == 2 then
						dap.configurations[name] = opts
					end

					index = index + 1
				end
			end
		end, 10)
	end,
}

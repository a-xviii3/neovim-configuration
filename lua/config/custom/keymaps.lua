--[[ keymaps set using core neovim commands or functions ]]

-- toggle relative numbers
NKeymap("<leader>rl", function()
	-- vim.opt.relativenumber returns a table instead of the required value
	---@diagnostic disable-next-line: undefined-field
	vim.opt.relativenumber = not vim.opt.relativenumber._value
end, { desc = "core/custom: toggle relative line numbers" })

-- toggle fold column
NKeymap("zt", function()
	-- vim.opt.foldcolumn returns a table instead of the required value
	---@diagnostic disable-next-line: undefined-field
	vim.opt.foldcolumn = vim.opt.foldcolumn._value == "0" and "auto:9" or "0"
end, { desc = "core/custom: toggle relative line numbers" })

-- edit options in a popup
NKeymap("<leader>op", function()
	local ui = vim.api.nvim_list_uis()[1]
	local width = math.floor((ui.width * 0.7) + 0.5)
	local height = math.floor((ui.height * 0.7) + 0.5)

	vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), true, {
		relative = "editor",
		width = width,
		height = height,
		col = (ui.width - width) / 2,
		row = (ui.height - height) / 2,
		focusable = true,
		border = "rounded",
	})

	local quick_settings_file_path = vim.fn.stdpath("config")
		.. "/lua/config/custom/quick_settings.lua"
	local quick_settings_file = io.open(quick_settings_file_path, "r")

	if quick_settings_file == nil then
		local default_quick_settings_file_path = vim.fn.stdpath("config")
			.. "/lua/config/base/quick_settings.lua"
		local default_quick_settings_file = io.open(default_quick_settings_file_path, "r")
		-- won't be nil
		---@diagnostic disable-next-line: need-check-nil
		local default_quick_settings_content = default_quick_settings_file:read("*a")
		-- won't be nil
		---@diagnostic disable-next-line: need-check-nil
		default_quick_settings_file:close()

		quick_settings_file = io.open(quick_settings_file_path, "w")
		-- won't be nil
		---@diagnostic disable-next-line: need-check-nil
		quick_settings_file:write(default_quick_settings_content)
	end

	-- won't be nill
	---@diagnostic disable-next-line: need-check-nil
	quick_settings_file:close()
	vim.cmd("e" .. quick_settings_file_path)
	NKeymap("q", "<cmd>close<CR>", {
		buffer = true,
		desc = "core/custom: close the quick settings popup",
	})
end, { desc = "core/custom: edit quick options" })

-- netrw toggling
local is_netrw_sidebar_open = false
NKeymap("<leader>e", function()
	if vim.bo.filetype == "netrw" and not is_netrw_sidebar_open then return end

	if not is_netrw_sidebar_open then
		vim.g.netrw_banner = 0
		vim.g.netrw_liststyle = 3
		vim.cmd("Lexplore %:p:h")
	else
		vim.cmd("Lexplore")
		vim.g.netrw_banner = 1
		vim.g.netrw_chgwin = -1 -- using lexplore changes this value which needs to be reset to prevent weird behaviour
		vim.g.netrw_liststyle = 1
	end

	is_netrw_sidebar_open = not is_netrw_sidebar_open
end, { desc = "core/custom: open the netrw sidebar" })
NKeymap("<leader>E", function()
	if is_netrw_sidebar_open then
		vim.cmd("Lexplore")
		vim.g.netrw_banner = 1
		vim.g.netrw_chgwin = -1 -- using lexplore changes this value which needs to be reset to prevent weird behaviour
		vim.g.netrw_liststyle = 1
		is_netrw_sidebar_open = false
	end

	if vim.bo.filetype == "netrw" then
		vim.cmd("Rexplore")
	else
		vim.cmd("Explore %:p:h")
	end
end, { desc = "core/custom: open the netrw explorer fullscreened" })

-- quick options changes
NKeymap("<leader>cl", function()
	vim.ui.input({ prompt = "Enter color column value: " }, function(input)
		if not input then return end

		vim.opt.colorcolumn = input
	end)
end, { desc = "core/custom: change the color column position" })
NKeymap("<leader>in", function()
	vim.ui.select(
		{ "tabs", "spaces" },
		{ prompt = "What style of indentation to be set: " },
		function(indentation_style)
			if not indentation_style then return end

			vim.ui.input({ prompt = "Enter tab length: " }, function(tab_len)
				if not tab_len or not tab_len:match("^%-?%d+$") then -- match statement checks if tab_len is a numeric string
					return
				end

				-- first convert everything to tabs as it is easier to work with
				vim.opt.expandtab = false
				vim.cmd( -- substitute instead of retab as the command also replaces inline spaces to tabs
					"silent! %s/\\(^\\s*\\)\\@<=" -- regex from https://stackoverflow.com/a/35050756
						-- vim.opt.tabstop returns a table instead of the required value
						---@diagnostic disable-next-line: undefined-field
						.. (" "):rep(vim.opt.tabstop._value)
						.. "/	/g"
				)

				vim.opt.tabstop = tonumber(tab_len)

				-- now if the aim is to indent to spaces then convert tabs to spaces
				if indentation_style == "spaces" then
					vim.opt.expandtab = true
					vim.cmd( -- substitute instead of retab as the command also replaces inline tabs with spaces
						"silent! %s/\\(^\\s*\\)\\@<=	/"
							-- vim.opt.tabstop returns a table instead of the required value
							---@diagnostic disable-next-line: undefined-field
							.. (" "):rep(vim.opt.tabstop._value)
							.. "/g"
					)
					vim.opt.listchars:append({
						-- vim.opt.tabstop returns a table instead of the required value
						---@diagnostic disable-next-line: undefined-field
						leadmultispace = "▎"
							.. ("∙"):rep(vim.opt.tabstop._value - 1),
					})
				end
			end)
		end
	)
end, { desc = "core/custom: change indentation style" })

-- toggle cursor movement
NKeymap(
	"<leader>lc",
	function() vim.opt.scrolloff = 999 - vim.opt.scrolloff end,
	{ desc = "core/custom: toggle between moving text and moving cursor" }
)

-- substitute
NKeymap("<leader>sw", function()
	vim.ui.input({ prompt = "Enter the target: " }, function(target)
		if not target or target == "" then return end

		vim.ui.input({ prompt = "Enter the substitution: " }, function(substitution)
			if not substitution or substitution == "" then return end

			vim.api.nvim_feedkeys(
				vim.api.nvim_replace_termcodes(
					":%s/\\<" .. target .. "\\>/" .. substitution .. "/gI",
					true,
					true,
					true
				),
				"n",
				false
			)
		end)
	end)
end, { desc = "core/custom: substitute standalone occurences of inputted word (not string)" })
NKeymap("<leader>ss", function()
	vim.ui.input({ prompt = "Enter the target: " }, function(target)
		if not target or target == "" then return end

		vim.ui.input({ prompt = "Enter the substitution: " }, function(substitution)
			if not substitution or substitution == "" then return end

			vim.api.nvim_feedkeys(
				vim.api.nvim_replace_termcodes(
					":%s/" .. target .. "/" .. substitution .. "/gI",
					true,
					true,
					true
				),
				"n",
				false
			)
		end)
	end)
end, { desc = "core/custom: substitute all occurences of inputted string (even as a substring)" })

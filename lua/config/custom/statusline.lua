--[[ format the statusline ]]

-- remove statusline background
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineTermNC", { bg = "none" })

Statusline_Components = {}
Statusline_Components.higroups = {
	filename = "Directory",
	position = "Substitute",
	mode = "IncSearch",
	warnings = "DiagnosticWarn",
	errors = "DiagnosticError",
}

Statusline_Components.filename = function()
	return ("%%#%s#%s%%*"):format(Statusline_Components.higroups.filename, " %t ")
end

Statusline_Components.position = function()
	return ("%%#%s#%s%%*"):format(Statusline_Components.higroups.position, " %l:%-c ~ %2p%% ")
end

local mode_strings = {
	["n"] = " normal ",
	["niI"] = " insert [normal] ",
	["niR"] = " replace [normal] ",
	["nt"] = " terminal [normal] ",
	["i"] = " insert ",
	["R"] = " replace ",
	["v"] = " visual ",
	["V"] = " visual [line] ",
	[""] = " visual [block] ",
	["c"] = " command ",
	["!"] = " command [external] ",
	["t"] = " terminal ",
}
Statusline_Components.mode = function()
	local mode = mode_strings[vim.fn.mode()]
	return ("%%#%s#%s%%*"):format(Statusline_Components.higroups.mode, mode)
end

Statusline_Components.warnings = function()
	local count = vim.diagnostic.count()[vim.diagnostic.severity.WARN]
	count = count and " " .. count .. " " or ""
	return ("%%#%s#%s%%*"):format(Statusline_Components.higroups.warnings, count)
end

Statusline_Components.errors = function()
	local warn_count = vim.diagnostic.count()[vim.diagnostic.severity.WARN]
	local error_count = vim.diagnostic.count()[vim.diagnostic.severity.ERROR]
	error_count = error_count and (warn_count and "" or " ") .. error_count .. " "
		or (warn_count and "" or " ")
	return ("%%#%s#%s%%*"):format(Statusline_Components.higroups.errors, error_count)
end

vim.opt.statusline = table.concat({
	"%{%v:lua.Statusline_Components.mode()%}",
	"%{%v:lua.Statusline_Components.warnings()%}",
	"%{%v:lua.Statusline_Components.errors()%}",
	"%r",
	"%w",
	"%h",
	"%m",
	"%=",
	"%{%v:lua.Statusline_Components.filename()%}",
	"%{%v:lua.Statusline_Components.position()%}",
}, "")

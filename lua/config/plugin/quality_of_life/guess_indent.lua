--[[ set buffer indentation options based on file content ]]

return {
	"nmac427/guess-indent.nvim",
	name = "guess_indent",
	-- missing parameter is not necessary for the function
	---@diagnostic disable-next-line: missing-parameter
	config = function() require("guess-indent").setup() end,
}

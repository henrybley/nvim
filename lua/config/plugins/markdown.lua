return {
	{
		"OXY2DEV/markview.nvim",
		ft = { "markdown" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("markview").setup({
				hybrid_mode = true, -- edit & preview in the same buffer
			})
		end,
	},
	{
		"jghauser/follow-md-links.nvim",
		ft = { "markdown" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			vim.keymap.set("n", "<BS>", ":edit #<CR>", { silent = true, buffer = true })
		end,
	},
}

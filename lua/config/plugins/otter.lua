return {
	"jmbuhr/otter.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("otter").setup({
			buffers = {
				preambles = {
					css = { "* {" },
				},
				postambles = {
					css = { "}" },
				},
			},
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			callback = function()
				require("otter").activate({ "css" })
			end,
		})
	end,
}

return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "nixfmt" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				php = { "php-cs-fixer" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				java = {},
			},
			formatters = {
				["php-cs-fixer"] = {
					command = "php-cs-fixer",
					args = {
						"fix",
						"$FILENAME",
					},
					stdin = false,
				},

			},
			notify_on_error = true,
		})
	end,
}

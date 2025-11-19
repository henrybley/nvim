-- Load from Base16 YAML scheme file
return {
	"y3owk1n/base16-pro-max.nvim",
	priority = 1000,
	config = function()
		local yaml_parser = require("base16-pro-max.parser")

		require("base16-pro-max").setup({
			-- Load colors from YAML file
			colors = yaml_parser.get_base16_colors("~/.config/duck-colors/dark-duck.yaml"),
			styles = { 
                dim_inactive_windows = true,
                italic = false,
                transparency = false,
            },
			plugins = { enable_all = true },
		})
		vim.cmd.colorscheme("base16-pro-max")
	end,
}

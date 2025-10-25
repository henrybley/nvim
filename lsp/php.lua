return {
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	root_markers = { "composer.json", ".git" },
	settings = {
		intelephense = {
			files = {
				maxSize = 1000000,
			},
			format = {
				enable = false, -- Disable built-in formatting, use external formatter
			},
		},
	},
}

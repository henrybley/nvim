return {
	cmd = { "phpactor", "language-server" },
	filetypes = { "php" },
	root_markers = { "composer.json", ".git" },
	settings = {
		phpactor = {
			language_server_phpstan = {
				enabled = true,
			},

			indexer = {
				enabled = true,
			},

			diagnostics = {
				enabled = true,
			},
		},
	},
}


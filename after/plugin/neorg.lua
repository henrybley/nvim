require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
				hook = function(keybinds)
					keybinds.map_event("norg", "n", "<Leader>os", "core.esupports.hop.hop-link", { split = "vsplit" })
					keybinds.map_event("norg", "n", "<Leader>oh", "core.esupports.hop.hop-link", { split = "split" })
				end,
			},
		},
		["core.esupports.hop"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					pathfinder = "~/notes/pathfinder-adventure", -- Format: <name_of_workspace> = <path_to_workspace_root>
				},
				index = "index.norg", -- The name of the main (root) .norg file
			},
		},
	},
})

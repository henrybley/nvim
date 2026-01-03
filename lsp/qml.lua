---@type vim.lsp.Config
return {
	cmd = { "qmlls" },
	filetypes = { "qml", "qmljs" },
	root_markers = { ".git", "qmlls.ini" },
    
	cmd_env = {
		QML_IMPORT_PATH = vim.env.QML_IMPORT_PATH,
		QT_PLUGIN_PATH = vim.env.QT_PLUGIN_PATH,
	},
}

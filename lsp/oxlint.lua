---@type vim.lsp.Config
return {
	cmd = { "oxlint", "--lsp" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_markers = { ".oxlintrc.json", "oxlintrc.jsonc", "oxlint.config.ts", "package.json", ".git" },
}

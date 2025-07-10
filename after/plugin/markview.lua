vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "markdown" and vim.fn.expand("%:p"):match("markview") then
			vim.opt_local.textwidth = 80
			vim.opt_local.formatoptions:append("t")
		end
	end,
})

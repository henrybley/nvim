-- my settings --
vim.opt.diffopt = { "internal", "filler", "closeoff", "linematch:40" }

vim.o.splitbelow = true
vim.o.splitright = true
--

vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.textwidth = 80

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.conceallevel = 2

-- to run in nvim do :lua SlintShowPreview("ComponentName")
function SlintShowPreview(component_name)
  -- this works but is deprecated for some reason
  --vim.lsp.buf.execute_command {
  --  command = 'slint/showPreview',
  --  arguments = {
  --    vim.uri_from_bufnr(0),
  --    component_name,
  --  },
  --}
  -- get the client for the current buffer.
  local client = vim.lsp.get_client_by_id(vim.lsp.get_clients({ bufnr = 0 })[1].id)

  if client and client.server_capabilities and client.server_capabilities.executeCommandProvider then
    client:exec_cmd {
      title = 'Preview Slint UI',
      command = 'slint/showPreview',
      arguments = {
        vim.uri_from_bufnr(0),
        component_name,
      },
    }
  else
    vim.notify("No active client or server does not support 'slint/showPreview' command.", vim.log.levels.WARN)
  end
end

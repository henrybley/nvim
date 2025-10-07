-- start my keymaps

-- codeactions
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })


-- vim-fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Yank
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Oil Open Parent Dir
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Keep visual mode indenting
vim.keymap.set("v", "<", "<gv", silent)
vim.keymap.set("v", ">", ">gv", silent)

-- save
vim.keymap.set({ "n", "i" }, "<C-s>", "<ESC>:wa<CR>")

-- LSP
-- Format
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ lsp_fallback = true })
end)

-- error management
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<leader><S-e>", "<cmd>lua require('telescope.builtin').diagnostics({ sort_by = 'severity' })<CR>")

-- Greek letters
vim.keymap.set("i", "<C-g>g", "<C-k>g*") -- gamma
vim.keymap.set("i", "<C-g>d", "<C-k>d*") -- delta
vim.keymap.set("i", "<C-g>h", "<C-k>h*") -- theta
vim.keymap.set("i", "<C-g>p", "<C-k>p*") -- pi
vim.keymap.set("i", "<C-g>s", "<C-k>s*") -- sigma
vim.keymap.set("i", "<C-g>f", "<C-k>f*") -- phi
vim.keymap.set("i", "<C-g>w", "<C-k>w*") -- omega
vim.keymap.set("i", "<C-g>q", "<C-k>q*") -- psi
vim.keymap.set("i", "<C-g>a", "<C-k>a*") -- alpha
vim.keymap.set("i", "<C-g>b", "<C-k>b*") -- beta
vim.keymap.set("i", "<C-g>e", "<C-k>e*") -- epsilon
vim.keymap.set("i", "<C-g>l", "<C-k>l*") -- lambda
vim.keymap.set("i", "<C-g>t", "<C-k>t*") -- tau

-- window management
vim.keymap.set("n", "<leader>wh", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>wn", "<cmd>new<CR>")
vim.keymap.set("n", "<leader>wm", "<cmd>vnew<CR>")
vim.keymap.set("n", "<leader>wc", "<cmd>close<CR>")
vim.keymap.set("n", "<leader>wg", "<cmd>hide<CR>")


-- end my keymaps


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- buffer management
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")
vim.keymap.set("n", "<leader>bl", "<cmd>ls<CR>")
vim.keymap.set("n", "<leader>bw", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>bq", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>bs", "<cmd>w<CR>")

-- window resizing
vim.keymap.set("n", "<leader><Right>", "<C-W>>5")
vim.keymap.set("n", "<leader><Left>", "<C-W><5")
vim.keymap.set("n", "<leader><Up>", "<C-W>+5")
vim.keymap.set("n", "<leader><Down>", "<C-W>-5")

-- tab management
vim.keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>td", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>tabnprevious<CR>")

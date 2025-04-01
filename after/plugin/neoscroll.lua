neoscroll = require("neoscroll");
neoscroll.setup({})
vim.keymap.set("n", "<C-k>", function () neoscroll.ctrl_u({ duration = 250}) end)
vim.keymap.set("n", "<C-j>", function () neoscroll.ctrl_d({ duration = 250}) end)

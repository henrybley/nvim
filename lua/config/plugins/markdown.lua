return {
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("markview").setup({
        hybrid_mode = true, -- edit & preview in the same buffer
      })
    end,
  },
  {
    "jghauser/follow-md-links.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      -- Function to handle both local and external links
      vim.keymap.set("n", "<CR>", function()
        local url = vim.fn.expand("<cfile>")
        if url:match("^https?://") or url:match("^www%.") then
          -- Open external links in default browser
          vim.fn.jobstart({ "xdg-open", url }, { detach = true })
        else
          -- Follow local markdown link
          require("follow-md-links").follow_link()
        end
      end, { silent = true, buffer = true })

      -- Backspace to go back
      vim.keymap.set("n", "<BS>", ":edit #<CR>", { silent = true, buffer = true })
    end,
  },
}

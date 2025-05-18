return {
    "olimorris/codecompanion.nvim",
    opts = {
        adapters = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    schema = {
                        model = {
                            default = "codestral:latest",
                        },
                        num_ctx = {
                            default = 20000,
                        },
                    },
                })
            end,
        }
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}

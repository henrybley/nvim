require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    { 
        "ellisonleao/gruvbox.nvim",
        priority = 1000 , 
        config = true, 
        opts = ...
    },
    { 
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    'nvim-treesitter/playground',

    'ThePrimeagen/harpoon',

    'rasulomaroff/reactive.nvim',

    'brenoprata10/nvim-highlight-colors',

    'mbbill/undotree',

    'tpope/vim-fugitive',

    'm4xshen/autoclose.nvim',

    'HiPhish/rainbow-delimiters.nvim',

    'lukas-reineke/indent-blankline.nvim',

    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },
    { 
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' }
        }
    },
    { 
        'hrsh7th/nvim-cmp',
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
          },
    },
    


    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua',
    'rafamadriz/friendly-snippets',
    "rafamadriz/friendly-snippets",
    
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        'chikko80/error-lens.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' }
    },


    'nvim-lua/lsp-status.nvim',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
})

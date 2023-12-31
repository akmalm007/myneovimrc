local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    --Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },


    --Color Scheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    --Tresitter
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    --Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { { "nvim-lua/plenary.nvim" } },
    },
    --Undotree
    { 'mbbill/undotree' },
    --Git thingy
    { 'tpope/vim-fugitive' },
    --LSP with Mason
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    --LSP Setup
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    {
        'L3MON4D3/LuaSnip',
        dependencies =
        { 'rafamadriz/friendly-snippets' },
    },
    { 'saadparwaiz1/cmp_luasnip' },
    {
        "windwp/nvim-autopairs",
        -- Optional dependency
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function()
            require("nvim-autopairs").setup {}
            -- If you want to automatically add `(` after selecting a function or method
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end,
    },
    --Indent Line
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    --GitSign
    { 'lewis6991/gitsigns.nvim' },
    --Status lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    --File Explorer Much better than Nvim_tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    --Discord presence
    { 'andweeb/presence.nvim' },
    --Tmux Navigation Pane
    { 'christoomey/vim-tmux-navigator' },
    --LSP Notification
    {
        "j-hui/fidget.nvim",
        opts = {
        },
    },
    --Commenting in Visual mode or Normal mode
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    { import = "chiper.customs" }
}
local opts = {}

require("lazy").setup(plugins, opts)

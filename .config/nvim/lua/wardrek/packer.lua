-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        -- or                            , tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- use('Yggdroot/LeaderF', {run = ':LeaderfInstallCExtension'})

    -- Colorscheme
    use('sainnhe/gruvbox-material')

    -- Better highlight
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    -- fav files
    use('nvim-lua/plenary.nvim')
    use('ThePrimeagen/harpoon')

    -- Manage undo
    use('mbbill/undotree')

    -- Git integration
    use('tpope/vim-fugitive')

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- Git indicator
    use('airblade/vim-gitgutter')

    -- Command line Autocompletion
    use {
        'gelguy/wilder.nvim',
        config = function()
        end,
    }

    -- vim tmux navigation
    use('christoomey/vim-tmux-navigator')

    -- jupyter-notebook integration
    use('luk400/vim-jukit')

    -- Better abbrev
    use('tpope/vim-abolish')

    -- abbrev reminder
    use {
        '0styx0/abbreinder.nvim',
        requires = {
            {
                '0styx0/abbremand.nvim',
                module = 'abbremand' -- if want to lazy load
            }
        },
        config = function()
            -- config can be empty to stay with defaults
            -- or anything can be changed, with anything unspecified
            -- retaining the default values
            require'abbreinder'.setup()
        end,
        event = 'BufRead', -- if want lazy load
    }
    -- Markdown syntax highlight
    use('godlygeek/tabular')
    use('preservim/vim-markdown')

    -- Markdown preview
    use {'iamcco/markdown-preview.nvim'}

    -- Blocks movements
    use('matze/vim-move')

    -- Keys reminder
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- vim barbar
    use 'nvim-tree/nvim-web-devicons'
    use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- Auto format
    use('sbdchd/neoformat')

    -- Commentary
    use('tpope/vim-commentary')

    -- file tree explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Better indent
    use "lukas-reineke/indent-blankline.nvim"

    use('ThePrimeagen/vim-be-good')
end)

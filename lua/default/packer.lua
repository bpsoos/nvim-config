vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use {
         'folke/trouble.nvim',
         requires = { { 'nvim-tree/nvim-web-devicons' } }
    }

	use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('mattn/vim-goimports')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
    use("EdenEast/nightfox.nvim")
    use {
        'averms/black-nvim',
        config = function()
            vim.cmd ':UpdateRemotePlugins'
        end
    }
    use {
        'stsewd/isort.nvim',
        config = function()
            vim.cmd ':UpdateRemotePlugins'
        end
    }
    use "nvim-lua/plenary.nvim"
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'
    use 'neovim/nvim-lspconfig'
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }
    use 'tpope/vim-abolish'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'astral-sh/ruff-lsp',
        requires = {
            {'neovim/nvim-lspconfig'}
        },
    }
    use {
        'NoahTheDuke/vim-just'
    }
end)


-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope find files and project navigation
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Colorscheme for nvim
  use ({
	'sainnhe/everforest',
	as = 'everforest',
	config = function()
		vim.g.everforest_background = 'medium'
		vim.cmd('colorscheme everforest')
	end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Visual logs 
  use 'fei6409/log-highlight.nvim'
  
  -- Status bar and themes
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  -- Project exploier in sidebar
  use "preservim/nerdtree"
end)

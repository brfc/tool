----------------
-- Options
----------------

local set = vim.opt

set.background		= "dark"
set.number		= true
set.clipboard		= "unnamedplus"
set.cursorline		= true
set.expandtab		= true
set.completeopt		= "noinsert,menuone,noselect"
set.hidden		= true
set.inccommand		= "split"
set.mouse		= "a"
set.title		= true
set.wildmenu		= true

set.ruler		= true
set.ignorecase		= true
set.hlsearch		= true
set.magic		= true
set.showmatch		= true
set.listchars		= "tab:>`,trail:~,extends:>,precedes:<"
set.list		= true


-----------------
-- Commands
-----------------

vim.cmd([[
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()
  	filetype plugin indent on
  	syntax on
]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-----------------
-- Plugins
-----------------

local packer		= require("packer")
vim.cmd([[ packadd packer.nvim ]])
packer.startup(function()
	-- Plugin list
	use("wbthomason/packer.nvim")

	-- Syntax parser
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ':TSUpdate'
	}

	use("windwp/nvim-autopairs")
	use("norcalli/nvim-colorizer.lua")

	 -- Dependencies
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("MunifTanjim/nui.nvim")

	 -- Git and File Browser
	use({ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" })
	use("lewis6991/gitsigns.nvim")
	use("nvim-telescope/telescope.nvim")

	if packer_bootstrap then
    		require('packer').sync()
	end
end)

require("gitsigns").setup()

require("neo-tree").setup({
	close_if_last_window = false,
	enable_diagnostics = true,
	enable_git_status = true,
	popup_border_style = "rounded",
	sort_case_insensitive = false,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
	window = { width = 30 },
})


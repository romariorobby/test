local status_ok, packer = pcall(require, "plugins.packerInit")
local plug_builtin = pcall(require,"plugins.plugs-builtin")
if not plug_builtin then
	print("Disable builtin plugins not detected")
	return false
end

if not status_ok then
	return false
end
local misc = require 'mario.utils.misc'
local use = packer.use
-- local plugin_status = qs.loadconfig()
local plugin_status = require "mario.config".plugins

vim.cmd[[
	augroup config_sync
		autocmd!
		autocmd BufWritePost ~/.config/nvim/lua/mario/config.lua lua R("mario.config")
		autocmd BufWritePost ~/.config/nvim/lua/mario/config.lua lua R("plugins")
		autocmd BufWritePost ~/.config/nvim/lua/mario/config.lua lua R("mario.keymaps")
	 " How to reload in vimscript? if can't wait until neovim lua mapping and cmd bit consistent
	 " autocmd BufWritePost ~/.config/nvim/lua/mario/config.lua lua qs.source("lua/mario/keymaps.vim", true)
	 " autocmd BufWritePost ~/.config/nvim/lua/mario/config.lua source <afile> | PackerSync
 	 "autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
	augroup end
]]

-- Check connection
-- if qs.checkconnection() then
-- -- Autocommand to reload neovim when save plugin.lua file
-- 	vim.cmd[[
-- 		augroup packer_user_conf  
-- 			autocmd!
-- 		" TODO: How to expand global variable to autocmd?
-- 		  autocmd BufWritePost ~/.config/nvim/lua/mario/config.lua source <afile> | PackerSync
-- 			autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
-- 		augroup end
-- 	]]
-- end

return packer.startup(function()
	-- local
	use "~/repos/kanagawa.nvim"
	use "~/repos/tokyonight.nvim"
	use "~/repos/rogruv.nvim"
	--
--	use { "romariorobby/nvcode-color-schemes.vim" }
	use "b0o/mapx.nvim"
	use {
		'wbthomason/packer.nvim',
		event = "VimEnter",
	}
	use 'lewis6991/impatient.nvim'

	use {'nvim-lua/popup.nvim'}
	use {'nvim-lua/plenary.nvim'}

	use {
    "norcalli/nvim-colorizer.lua",
    disable = not plugin_status.colorizer,
    event = "BufRead",
		config = function()
			require("plugins.colorizer")
		end
	}

	use {
		"nvim-telescope/telescope.nvim",
		disable = not plugin_status.telescope.main,
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require("plugins.telescope")
		end,
	}
	-- LSP
	use {
		"neovim/nvim-lspconfig",
		disable = not plugin_status.lsp.main,
		config = function()
			require('plugins.lsp')
		end
	}
  use {
		"williamboman/nvim-lsp-installer", -- simple to use language server installer
		disable = not plugin_status.lsp.ext.installer,
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		disable = not plugin_status.treesitter,
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end
	}
	use {
		"akinsho/bufferline.nvim",
		disable = not plugin_status.bufferline,
	}

	use {
		'kyazdani42/nvim-web-devicons',
		disable = not plugin_status.icons.devicons
	}

	local has_nonicons = vim.fn.system({"fc-list", "nonicons"})
	if has_nonicons ~= '' then
 		if not plugin_status.icons.nonicons then
			print("nonicons found on the system")
			misc.warn("nvim-nonicons disabled")
		else
			use {
				'yamatsum/nvim-nonicons',
				disable = not plugin_status.icons.nonicons
			}
		end
	else
		misc.warn("Nonicons not installed on this machine.\nhttps://github.com/yamatsum/nonicons")
	end

  use {
		'nvim-lualine/lualine.nvim',
		disable = not plugin_status.lualine,
		config = function()
			require("plugins.lualine")
		end
	}

	use {
		'kyazdani42/nvim-tree.lua',
		disable = not plugin_status.nvimtree,
		config = function()
			require("plugins.nvimtree")
		end
	}

	use {'JoosepAlviste/nvim-ts-context-commentstring'}
  use {
		"numToStr/Comment.nvim",
		disable = not plugin_status.comment,
		config = function()
      require('Comment').setup()
--			require('plugins.comment')
		end
	}
	use {
		"folke/which-key.nvim",
		disable = not plugin_status.whichkey,
		event = "BufWinEnter",
		config = function()
			require("plugins.whichkey")
		end
	}

	-- CMP
	use {
		"hrsh7th/nvim-cmp",
		disable = not plugin_status.nvim_cmp.main,
		config = function()
			require("plugins.cmp")
		end
	}
	use {
		"hrsh7th/cmp-nvim-lsp",
		disable = not plugin_status.nvim_cmp.ext.lsp,
	}
	use {
		"hrsh7th/cmp-nvim-lua",
		disable = not plugin_status.nvim_cmp.ext.lua,
	}
	use {
		"hrsh7th/cmp-buffer",
		disable = not plugin_status.nvim_cmp.ext.buf,
	}
	use {
		"hrsh7th/cmp-path",
		disable = not plugin_status.nvim_cmp.ext.path,
	}
	use {
		"hrsh7th/cmp-cmdline",
		disable = not plugin_status.nvim_cmp.ext.cmd,
	}

	-- Luasnip
	use {
		"L3MON4D3/LuaSnip",
		disable = not plugin_status.luasnip
	}
  -- use "saadparwaiz1/cmp_luasnip" -- snippet completions

  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	use {
		"ellisonleao/glow.nvim",
		disable = not plugin_status.glow
	}
  use {
		"ahmedkhalf/project.nvim",
		disable = not plugin_status.telescope.ext.project,
		config = function()
			require("plugins.project")
		end
	}

	-- Notes
	--
	use {
		"vimwiki/vimwiki",
		disable = not plugin_status.vimwiki,
--		config = require("plugins.vimwiki").config,
		config = function()
			require("plugins.vimwiki")
		end
	}
	
	use {
		'nvim-orgmode/orgmode',
		disable = not plugin_status.orgmode,
		config = function()
				require("plugins.orgmode")
		end
	}

	use {
		"nvim-neorg/neorg", 
		disable = not plugin_status.neorg,
		requires = {
			"nvim-neorg/neorg-telescope"
		},
		config = function()
			require("plugins.neorg")
		end

	}

	use {
		'ledger/vim-ledger',
		disable = not plugin_status.vimledger

	}

	-- Git
	use({
		"ruifm/gitlinker.nvim",
		disable = not plugin_status.gitlinker,
		config = function()
			require('plugins.gitlinker')
		end
	})
	-- GIT
	use({
		"lewis6991/gitsigns.nvim",
		disable = not plugin_status.gitsigns,
		event = "BufRead",
		config = function()
			require('plugins.gitsigns')
		end
	})

	if packer.PACKER_BOOSTRAP then
		require("packer").sync()
	end
end)

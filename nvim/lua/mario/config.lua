-- Enble/Disable Plugins
return {
	plugins = {
		keymap = false,
		telescope = {
			main = true,
			ext = {
				project = true,
				media_files = false,
			}
		},
		bufferline = false,
		-- Completion
		nvim_cmp = {
			main = true,
			ext = {
				lsp = true,
				lua = true,
				buf = true,
				path = true,
				cmd = true,
			}
		},
		icons = {
			devicons = true,
			nonicons = true,
		},
		lsp = {
			main = true,
			ext = {
				installer = true,
			}
		},
		colorizer = true,
		treesitter = true,
		whichkey = true,
		-- Snippets
		luasnip = true,
		comment = true,
		lualine = true,
		nvimtree = true,
		git = {

		},
		gitlinker = true,
		gitsigns = true,
		-- Document
		vimwiki = false,
		orgmode = true,
		neorg = true,
		vimledger = true,
		glow = true,
		markdownpreview = true,
	},
}

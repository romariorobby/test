local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

configs.setup {
	ensure_installed = {
			"vim",
			"lua",
	},
	sync_install = false,
	ignore_install = {""}, --list of parses to ignored
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "" }, -- list of lang that will disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
}

-- Custom Parser
-- Orgmode
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

-- Neorg
parser_config.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_config.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_config.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}

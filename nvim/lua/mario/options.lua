-- local cmd = vim.cmd
local options = {
--	clipboard = "unnamedplus", -- Access system clipboard
	pumheight = 10,            -- popmenu height in command mode?
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  cmdheight = 2,             -- more space in the neovim command line for displaying messages
	number = true,             -- `nu` Line number
	relativenumber = true,     -- `rnu` Relative number
	mouse = "n",               -- Enable mouse support
	writebackup = false,       --
	backup = false,            -- Backup file
	fileencoding = "utf-8",    -- encoding written to a file
	undofile = true,
  expandtab = false,          -- convert tabs to spaces
	wrap = false,              -- display lines as long lines
	updatetime = 300,          -- faster completion (4000ms default)
	shiftwidth = 2,            -- the number of spaces inserted for each indentation
	tabstop = 2,               -- insert 2 spaces for a tab
	swapfile = false,
	hlsearch = true,           -- `insearch` Highlihgt all matches search
	ignorecase = false,        -- ignore case in search pattern
	smartcase = true,          -- smart case
	smartindent = true,        --
	termguicolors = true,      -- set term gui colors for terminal
	splitright = true,         -- put hsplit below of current window
	splitbelow = true,         -- put vsplit right of current window
  timeoutlen = 350,          -- time to wait for a mapped sequence to complete (in milliseconds) (whichkey)
 	-- ttimeoutlen = 100,         --
	cursorline = true,         -- highlight the current line
  signcolumn = "yes",        -- always show the sign column, otherwise it would shift the text each time
	scrolloff = 10,            -- keep distance 10 lines
	guifont = "monospace:h17", -- font used in neovim GUI
  showmode = false,          -- we don't need to see things like -- INSERT -- anymore

}
for k,v in pairs(options) do
	vim.opt[k] = v
end

local status_ok, config = pcall(require, "mario.config")
if not status_ok then
   return
end
local plugin_status = config.plugins

vim.g.mapleader = " "       -- <Space>
vim.g.maplocalleader = " m" -- <Space>m
local fn = vim.fn
local nnoremap = qs.nnoremap
local inoremap = qs.inoremap
local vnoremap = qs.vnoremap
local xnoremap = qs.xnoremap
local cmap = qs.cmap
local map = qs.map
local name = qs.name
map("<Space>", "<Nop>")
-- Fun, freeze arrow :)
inoremap("<Up>",	"<C-o>:echom '---> k <---'<CR>")
inoremap("<Down>", "<C-o>:echom '---> j <---'<CR>")
inoremap("<Right>",	"<C-o>:echom '---> l <---'<CR>")
inoremap("<Left>", "<C-o>:echom '---> h <---'<CR>")

-- Command Mode Navigation
cmap("<C-h>", "<Left>")
cmap("<C-l>", "<Right>")
cmap("<C-k>", "<Up>")
cmap("<C-j>", "<Down>")
cmap("<C-D>", "<C-E><C-U>")

-- Norma mode Navigation
nnoremap("<leader>h", "<C-w>h", {label = "which_key_ignore"})
nnoremap("<leader>l", "<C-w>l", {label = "which_key_ignore"})
nnoremap("<leader>j", "<C-w>j", {label = "which_key_ignore"})
nnoremap("<leader>k", "<C-w>k", {label = "which_key_ignore"})

-- split window
nnoremap("<leader>s", "<C-w>s", {label = "which_key_ignore"})
nnoremap("<leader>v", "<C-w>v", {label = "which_key_ignore"})
nnoremap("<leader>ws", "<C-w>s", {label = "Horizontal split"})
nnoremap("<leader>wv", "<C-w>v", {label = "Vertical split"})
                     
-- Buffer
nnoremap("<A-Tab>", "<C-^>") -- Switch between alternate file

nnoremap("<leader>bnn", "<cmd>split | ene | startinsert<cr>", {label = "New buffer"})
nnoremap("<leader>bns", "<cmd>split | ene | startinsert<cr>", {label = "New buffer split"})
nnoremap("<leader>bnv", "<cmd>vsplit | ene | startinsert<cr>", {label = "New buffer vsplit"})

nnoremap({"<leader>bc", "<leader>bd"}, "<cmd>bdelete<cr>", {label = "Delete"})

nnoremap("<leader>bC", "<cmd>bwipeout<cr>", {label = "Wipeout"})

nnoremap({"<S-Tab>","<leader>bh", "<leader>b["}, "<cmd>bprevious<cr>", {label = "Previous"})
nnoremap({"<Tab>","<leader>bl", "<leader>b]"}, "<cmd>bnext<cr>", {label = "Next"})

nnoremap({"<leader>bg", "<leader>b0"}, "<cmd>bfirst<cr>", {label = "First Buffer"})

nnoremap("<leader>bG", "<cmd>blast<cr>", {label = "Last Buffer"})
--
-- Window
nnoremap("<leader>wR", "<C-w>R",{label = "Rotate upward"}) --Rotate upwards/leftwards
nnoremap("<leader>wr", "<C-w>r", {label = "Rotate downward"}) -- Rotate downward/rightwards
nnoremap("<leader>ww", "<C-w>x", {label = "Swap"}) --Swap/Exchange
nnoremap("<leader>wH", "<C-w>H", {label = "Move to farthest left"}) --Move to far left
nnoremap("<leader>wJ", "<C-w>J", {label = "Move to farthest bottom"}) --Move to very bottom
nnoremap("<leader>wK", "<C-w>K", {label = "Move to farthest top"}) --Move to very top
nnoremap("<leader>wL", "<C-w>L", {label = "Move to farthest right"}) --Move to far right
-- gotta type it fast due conflict with whichkey <BS> for back. TODO: map whichkey <BS> for back
nnoremap({"<A-BS>","<leader>w0", "<leader>w<BS>"}, "<C-w>=", {label = "Reset"}) --Reset Window

nnoremap({"<leader>w-", "<A-->"}, "<C-w>-", {label = "Height: Decrease -1"}) --Height: Decrease -1
nnoremap({"<leader>w=", "<A-=>"}, "<C-w>+", {label = "Height: Increase +1"}) --Height: Increase +1

nnoremap({"<leader>w,", "<A-,>"}, "<C-w><", {label = "Width: Decrease -1"}) --Width: Decrease -1
nnoremap({"<leader>w.", "<A-.>"}, "<C-w>>", {label = "Width: Increase +1"})--Width: Increase +1

nnoremap("<leader>w+", "<C-w>5+", {label = "Height: Increase +5"}) --Height: Increase +5
nnoremap("<leader>w_", "<C-w>5-", {label = "Height: Decrease -5"}) --Height: Decrease -5

nnoremap("<leader>w<", "<C-w>5<", {label = "Width: Decrease -5"}) --Width: Decreaes -5
nnoremap("<leader>w>", "<C-w>5>", {label = "Width: Increase +5"}) --Width: Increase +5

nnoremap("<leader>w/", "<C-w>_", {label = "Maximize: Horizontal"}) --Maximize: Horizontal
nnoremap("<leader>w<bar>", "<C-w><bar>", {label = "Maximize: Vertical"}) --Maximize: Vertical
nnoremap("<leader>wf", "<C-w>_", {label = "Maximize: Horizontal"}) --Maximize: Horizontal
nnoremap("<leader>wF", "<C-w><bar>", {label = "Maximize: Vertical"}) --Maximize: Vertical
nnoremap("<leader>w<TAB>", "<C-w>T", {label = "Move this file to new tab"}) --Move to new tab

---
--- TAB
---
nnoremap("<leader><Tab>c", "<cmd>tabc<cr>", {label = "Close Tab"})
nnoremap("<leader><Tab>d", "<cmd>tabc<cr>", {label = "Close Tab"})
nnoremap("<leader><Tab>C", "<cmd>tabonly<cr>", { label = "Close other tabs"})
nnoremap("<leader><Tab>a", "<cmd>tabnew<cr>", {label = "New"})
nnoremap("<leader><Tab>l", "<cmd>tabn<cr>", { label = "Next"})
nnoremap("<leader><Tab>h", "<cmd>tabp<cr>", { label = "Previous"})
nnoremap("<leader><Tab>]", "<cmd>tabn<cr>", { label = "Next"})
nnoremap("<leader><Tab>[", "<cmd>tabp<cr>", { label = "Previous"})

-- TODO: Only mapping this in certain buffer and filetype
if fn.executable("compiler") == 1 then
	nnoremap({"<localleader><C-x>", "<localleader>X"}, "<cmd>!compiler %<CR>", {label = "Compile with compiler"})
end

if plugin_status.nvimtree then
	nnoremap("<leader>tn", "<cmd>NvimTreeToggle<cr>", { label = "Explorer" })
end

if plugin_status.telescope.main then
	nnoremap("<leader>fn", "<cmd>lua require('plugins.telescope').find_neovim()<cr>", { label = "Neovim Dir" })
	nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", {label = "Find Files"})
	nnoremap({"<leader>fb", "<leader>bf"}, "<cmd>lua require('plugins.telescope').find_buffers()<cr>", {label = "Buffer"})
	nnoremap("<leader>fg", "<cmd>lua require('plugins.telescope').grep_prompt()<cr>", {label = "Grep prompt"})
	nnoremap("<leader>fr", "<cmd>Telescope oldfiles<cr>", {label = "Recent files"})
	nnoremap("<leader>fF", "<cmd>Telescope live_grep theme=ivy<cr>", {label = "Live search"})
	nnoremap("<leader>f.", "<cmd>lua require('plugins.telescope').find_dotfiles()<cr>", {label = "Dotfiles"})
	nnoremap("<leader>Ht", "<cmd>Telescope colorscheme theme=dropdown<cr>", {label = "Themes"})
	nnoremap("<leader>H?", "<cmd>Telescope commands theme=ivy<cr>", {label = "Commands" })
	nnoremap("<leader>Ho", "<cmd>Telescope vim_options theme=ivy<cr>", {label = "Vim options/settings" })
	nnoremap("<leader>Hk", "<cmd>Telescope keymaps theme=ivy<cr>", {label = "Keymaps" })
	nnoremap("<leader>nf", "<cmd>lua require('plugins.telescope').find_notes()<cr>", {label = "Notes"})
	if plugin_status.telescope.ext.project then
		nnoremap("<leader>fpp", "<cmd>Telescope projects<cr>", {label = "Switch Projects"})
	end
end
--
nnoremap("<leader>tl", "<cmd>lua qs.toggleline()<cr>", {label = "Line"})
nnoremap("<leader>tw", "<cmd>lua qs.togglewrap()<cr>", {label = "Wrap"})

if plugin_status.colorizer then
	nnoremap("<leader>tc", "<cmd>ColorizerToggle<cr>", {label = "Colorizer"})
end
-- LSP
nnoremap("<leader>cli", "<cmd>LspInfo<cr>", {label = "Lsp Info"})
nnoremap("<leader>cls", "<cmd>LspStart<cr>", {label = "Lsp Start"})
nnoremap("<leader>clS", "<cmd>LspStop<cr>", {label = "Lsp Stop"})
nnoremap("<leader>clr", "<cmd>LspRestart<cr>", {label = "Lsp Restart"})

if plugin_status.orgmode then
	name("<leader>na", { label = "Org: Agenda"})
	name("<leader>nc", "Org: Capture")
end

if plugin_status.gitsigns then
	name("<leader>gt", "Toggle")
	nnoremap({"<leader>tgs", "<leader>gts"}, "<cmd>Gitsigns toggle_signs<cr>", {label = "signs"})
	nnoremap("<leader>gtn", "<cmd>Gitsigns toggle_numhl<cr>", {label = "numhl"})
	nnoremap("<leader>gtl", "<cmd>Gitsigns toggle_linehl<cr>", {label = "linehl"})
	nnoremap("<leader>gtw", "<cmd>Gitsigns toggle_word_diff<cr>", {label = "Word diff"})
	nnoremap("<leader>gb", "<cmd>Gitsigns blame_line<cr>", { label = "Blame"})
	nnoremap("<leader>gD", "<cmd>Gitsigns diffthis<cr>", { label = "Diff this"})
	-- nnoremap("<leader>gB", "<cmd>Gitsigns blame_line<cr>", )
	nnoremap("<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { label = "Undo stage Hunk"})
	nnoremap("<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", {label = "Reset Buffer"})
	nnoremap("<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",{ label = "Reset Hunk"})
	nnoremap({"<leader>gj", "[g"}, "<cmd>Gitsigns next_hunk<cr>", { label = "Next Hunk"})
	nnoremap({"<leader>gk", "]g"}, "<cmd>Gitsigns prev_hunk<cr>", { label = "Prev Hunk"})
	nnoremap("<leader>g]", "&diff ? '<leader>g]' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'", {label = "Next Hunk"}, { expr = true})
	nnoremap("<leader>g[", "&diff ? '<leader>g[' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'", {label = "Prev Hunk"}, { expr = true})
end

vim.cmd[[
	autocmd FileType sh lua qs.nnoremap("<leader>fXc", "<cmd>silent !chmod +x %<CR>")
]]
-- Ledger
nnoremap("<leader>nl", ":!make -C $LEDGER_DIR ", {label = "Ledger make expand.."})
nnoremap({"<leader>fS", "<leader>aS"}, "<cmd>source %<cr>", {label = "Source this file"})

-- Test
-- Copy to system clipboard
vnoremap('<C-c>', '"+y')
xnoremap('<leader>v', '"_dP')
-- Paste from system clipboard
inoremap('<C-v>', '<Esc>"+p')


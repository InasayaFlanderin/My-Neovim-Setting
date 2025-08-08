--This must happened before plugin loaded, otherwise wrong one will be loaded
vim.g.mapleader = ' '
vim.g.maplocaleader = ' '
--Line number turned on 
vim.o.number = true
--Mouse mode
vim.g.mouse = 'm'
--Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
--No wrap
vim.o.wrap = false
--Sign column on
vim.o.signcolumn = 'yes'
--Update time and mapped sequence wait time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
--Display white space and cursor
vim.o.list = true
vim.opt.listchars = { tab = '»»', trail = '·', nbsp = ' ' }
vim.o.cursorline = true
--remap and plugin
vim.keymap.set('n', 'i', 'a', { noremap = true })
vim.keymap.set('n', 'e', ':Ex<CR>', { noremap = true })
vim.keymap.set('n', '<leader>d', 'yyp', { noremap = true })
--Tabs
vim.keymap.set('n', 'tt', ':tabnext<CR>', { noremap = true })
vim.keymap.set('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.keymap.set('n', 'tp', ':tabprev<CR>', { noremap = true })
--Splits
vim.keymap.set('n', "sh", ":sp<CR>", { noremap = true })
vim.keymap.set('n', "sv", ":vsp<CR>", { noremap = true})
vim.keymap.set('n', 'h', '<C-w>h', { noremap = true })
vim.keymap.set('n', 'j', '<C-w>j', { noremap = true })
vim.keymap.set('n', 'k', '<C-w>k', { noremap = true })
vim.keymap.set('n', 'l', '<C-w>l', { noremap = true })
--Plugin
local pluginList = {
	"savq/paq-nvim",
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	"nvim-telescope/telescope-fzf-native.nvim",
	"nvim-lua/plenary.nvim",
	{ "nvim-treesitter/nvim-treesitter", run = TSUpdate },
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/playground",
	'mbbill/undotree',
	"echasnovski/mini.statusline",
	"folke/todo-comments.nvim",
	"dasupradyumna/midnight.nvim",
	"HiPhish/rainbow-delimiters.nvim"
}
require("paq"):setup({})(pluginList)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", builtin.find_files)
vim.keymap.set('n', 'fg', builtin.live_grep)
vim.keymap.set('n', 'fb', builtin.buffers)
vim.keymap.set('n', 'fh', builtin.help_tags)

vim.g.undotree_DiffCommand = "FC"
vim.keymap.set("n", "q", vim.cmd.UndotreeToggle)

require("nvim-treesitter.configs").setup({
	ensure_installed = {"lua", "java", "vim", "vimdoc", "markdown", "markdown_inline", "xml"},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
})
vim.keymap.set("n", "a", vim.cmd.TSPlaygroundToggle)

require("mini.statusline").setup()
--Theme
vim.g.neon_style = "dark"
vim.g.neon_italic_comment = true
vim.g.neon_italic_keyword = true
vim.g.neon_italic_boolean = true
vim.g.neon_italic_function = true
vim.g.neon_italic_variable = true

vim.cmd[[colorscheme midnight]]

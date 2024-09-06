vim.opt.guicursor = "n-v-c-i-ci-r-cr-o:block"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.listchars = { tab = '>-', space = '␣' }
vim.opt.list = true

vim.g.have_nerd_font = true

vim.lsp.set_log_level("off")
vim.g.python3_host_prog = vim.fn.expand('$HOME') .. '/.local/venv/nvim/bin/python'
vim.cmd.colorscheme('nightfox')


require'nvim-treesitter.configs'.setup {
 ignore_install = { "yaml" },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
}
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
configs.solidity = {
  default_config = {
    cmd = {'nomicfoundation-solidity-language-server', '--stdio'},
    filetypes = { 'solidity' },
    root_dir = lspconfig.util.find_git_ancestor,
    single_file_support = true,
  },
}
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
}

vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
} 
   
lvim.keys.normal_mode["<S-f>"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<space>'"] = ":Lizard<CR>"
lvim.keys.visual_mode["<space>v"] = "g<C-G>"
lvim.keys.normal_mode["<C-a>"] = "ggVG"
lvim.keys.normal_mode["<C-s>"] = "zfa]"
lvim.keys.normal_mode["<C-z>"] = "zfa}"
lvim.builtin.which_key.mappings["ç"] = {
  name = "+Trouble",
  l = {"<cmd>TroubleToggle<cr>","General panel"},
  k = {"<cmd>TroubleToggle workspace_diagnostics<cr>","Workspace diagnostics"},
  j = {"<cmd>TroubleToggle document_diagnostics<cr>","Document diagnosticas"},
  h = {"<cmd>TroubleToggle loclist<cr>","Loclist"},
  g = {"<cmd>TroubleToggle quickfix<cr>","Quickfix"},
  f = {"<cmd>TroubleToggle lsp_references<cr>","LSP References"}
}

lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "wakatime/vim-wakatime"},
  { 'folke/trouble.nvim'},
  { 'jose-elias-alvarez/typescript.nvim' },
  { 'mg979/vim-visual-multi' },
  { 'juancolchete/lizard'},
  { 'brooth/far.vim'},
  { 'ikatyang/tree-sitter-yaml' }
}

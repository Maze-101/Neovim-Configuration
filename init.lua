-- init.lua (Main configuration file)

-- Load basic settings
require("user.settings")

-- Load plugins
require("user.plugins")

-- Load theme and statusline
require("user.theme")

-- Load file explorer configuration
require("user.file-explorer")

-- Load autopairs
require("user.autopairs")

-- Load LSP (Language Server Protocol) settings
require("user.lsp")

-- Load custom keymaps
require("user.keymaps")

-- Load treesitter
require("user.treesitter")

-- Load auto-template logic
require("user.template")
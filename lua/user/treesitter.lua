-- lua/user/treesitter.lua
-- This file configures nvim-treesitter for syntax highlighting.

local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter_configs.setup({
  -- A list of parser names, or "all"
  ensure_installed = { "cpp", "c", "java", "lua", "vim" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true, -- Enable syntax highlighting
  },
  indent = {
    enable = true, -- Enable better indentation
  },
})

-- lua/user/file-explorer.lua
-- This file configures the nvim-tree file explorer.

-- Safely require the plugin
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("Plugin 'nvim-tree' not found!", "warn")
    return
end

-- Configuration
nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

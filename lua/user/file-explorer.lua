-- lua/user/file-explorer.lua
-- This file configures nvim-tree.lua

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  sort_by = "case_sensitive",
  -- This tells nvim-tree to track the file you are currently focused on
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- This explicitly disables the "Pick a window" prompt
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  view = {
    width = 30,
    side = "left",
    -- This helps the file explorer resize more intelligently
    adaptive_size = true,
  },
  filters = {
    dotfiles = true,
  },
})
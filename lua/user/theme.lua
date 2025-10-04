-- lua/user/theme.lua
-- This file configures your theme and statusline.

-- Gruvbox Theme Configuration
vim.g.gruvbox_contrast_dark = "medium" -- or "hard", "soft"

-- Safely set the colorscheme
local colorscheme_status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not colorscheme_status then
  vim.notify("Colorscheme 'gruvbox' not found!", "warn")
end

-- Lualine (Statusline) Configuration
-- Safely require lualine
local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
  vim.notify("Lualine plugin not found!", "warn")
  return -- Stop processing this file if lualine is not available
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path=1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}


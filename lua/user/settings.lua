-- lua/user/settings.lua
-- This file contains core Neovim settings.

local opt = vim.opt -- for conciseness

-- Line Numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true         -- shows absolute line number on cursor line (when relative is on)

-- Tabs & Indentation
opt.tabstop = 4       -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4    -- 4 spaces for autoindent
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- Search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- Appearance
opt.termguicolors = true -- enable 24-bit RGB colors
opt.background = "dark"  -- can be "dark" or "light"
opt.signcolumn = "yes"   -- always show the sign column

-- Behavior
opt.clipboard = "unnamedplus" -- use system clipboard
opt.swapfile = false          -- don't create swap files
opt.backup = false            -- don't create backup files
opt.undofile = true           -- persistent undo
opt.splitright = true         -- open vertical splits to the right
opt.splitbelow = true         -- open horizontal splits below

-- Folding
opt.foldmethod = "marker" -- enable folding (default marker)

-- Behavior
opt.clipboard = "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }

opt.swapfile = false
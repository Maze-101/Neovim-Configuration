-- lua/user/keymaps.lua
-- This file defines custom keyboard shortcuts (keymaps).

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode Keymaps
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Create a new file in the current directory
vim.keymap.set("n", "<leader>n", function()
  -- Get the directory of the current file
  local current_dir = vim.fn.expand('%:p:h') .. '/'

  -- If the buffer has no file path, default to the current working directory
  if current_dir == "/" then
    current_dir = vim.fn.getcwd() .. '/'
  end

  vim.ui.input({ prompt = "New File: ", default = current_dir }, function(filename)
    if filename and filename ~= "" then
      vim.cmd("edit " .. filename)
    end
  end)
end, {
    noremap = true,
    desc = "New file in current directory"
})

-- Competitive Programming Keymaps --
vim.keymap.set("n", "<F5>", ":!g++ -std=c++17 % -o %:r && ./%:r < input.txt > output.txt<CR>", {
    noremap = true,
    silent = false,
    desc = "Compile & Run with file I/O"
})

vim.keymap.set("n", "<F6>", ":!g++ -std=c++17 % -o %:r && ./%:r<CR>", {
    noremap = true,
    silent = false,
    desc = "Compile & Run in background"
})

vim.keymap.set("n", "<F7>", ":vsplit | terminal g++ -std=c++17 % -o %:r && ./%:r<CR>", {
    noremap = true,
    silent = false,
    desc = "Compile & Run in interactive terminal"
})

-- Visual Mode
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- lua/user/lsp.lua
-- This file configures the Language Server Protocol (LSP) for code intelligence.

-- Safely require all necessary plugins
local status_ok, mason = pcall(require, "mason")
if not status_ok then return end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then return end

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then return end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then return end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then return end

-- Setup for mason to manage LSPs
mason.setup()

-- nvim-cmp setup (must be before LSP setup)
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

-- LSP Configuration
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Use mason-lspconfig to connect lspconfig to mason
mason_lspconfig.setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { "clangd" },
    
    -- This is the new, recommended way to set up servers
    handlers = {
        function(server_name) -- default handler (for servers with no custom options)
            lspconfig[server_name].setup({
                capabilities = capabilities,
            })
        end,
    }
})


-- Global mappings for LSP
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

-- Autotrigger completions
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
local luasnip = require("luasnip")

vim.api.nvim_create_autocmd("TextChangedI", {
  callback = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line_text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    local char_before_cursor = string.sub(line_text, col, col)

    if char_before_cursor ~= "" and char_before_cursor:match("%s") then
        return
    end

    if cmp.get_active_entry() or (luasnip.expandable() or luasnip.expand_or_jumpable()) then
        return
    end
    
    cmp.complete()
  end
})
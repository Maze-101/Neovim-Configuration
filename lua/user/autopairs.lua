-- lua/user/autopairs.lua
-- This file configures nvim-autopairs

local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

autopairs.setup({
  check_ts = true, -- Check treesitter
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false,
  },
})

-- Integrate with nvim-cmp
local cmp_autopairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_ok then
  return
end

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
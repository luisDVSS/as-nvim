--- gitsigns.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  local signs = {
    Add = { fg = p.green, bg = p.diff_add },
    Change = { fg = p.orange, bg = p.diff_change },
    Delete = { fg = p.red, bg = p.diff_del },
    Topdelete = { fg = p.red, bg = p.diff_del },
    Changedelete = { fg = p.orange, bg = p.diff_change },
    Untracked = { fg = p.fg_muted, bg = p.bg },
  }

  for name, colors in pairs(signs) do
    hl("GitSigns" .. name, { fg = colors.fg, bg = p.bg })
    hl("GitSigns" .. name .. "Nr", { fg = colors.fg, bg = p.bg })
    hl("GitSigns" .. name .. "Ln", { bg = colors.bg })
    hl("GitSigns" .. name .. "Inline", { bg = colors.bg })
  end

  hl("GitSignsStagedAdd", { fg = p.green, bg = p.bg })
  hl("GitSignsStagedChange", { fg = p.orange, bg = p.bg })
  hl("GitSignsStagedDelete", { fg = p.red, bg = p.bg })
  hl("GitSignsStagedTopdelete", { fg = p.red, bg = p.bg })
  hl("GitSignsStagedChangedelete", { fg = p.orange, bg = p.bg })

  hl("GitSignsCurrentLineBlame", { fg = b:blend(p.fg_muted, 0.7), italic = true })
  hl("GitSignsAddPreview", { fg = p.fg, bg = p.diff_add })
  hl("GitSignsDeletePreview", { fg = p.fg, bg = p.diff_del })
  hl("GitSignsAddInline", { bg = b:blend(p.green, 0.3) })
  hl("GitSignsChangeInline", { bg = b:blend(p.orange, 0.3) })
  hl("GitSignsDeleteInline", { bg = b:blend(p.red, 0.3) })
end

return M

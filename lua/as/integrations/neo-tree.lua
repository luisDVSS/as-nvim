--- neo-tree.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("NeoTreeNormal", { fg = p.fg, bg = p.bg_alt })
  hl("NeoTreeNormalNC", { fg = p.fg, bg = p.bg_alt })
  hl("NeoTreeDimText", { fg = p.fg_muted })
  hl("NeoTreeTitleBar", { fg = p.bg, bg = p.blue, bold = true })
  hl("NeoTreeRootName", { fg = p.purple, bold = true })

  hl("NeoTreeDirectoryName", { fg = p.blue })
  hl("NeoTreeDirectoryIcon", { fg = p.blue })
  hl("NeoTreeFileIcon", { fg = p.fg_muted })
  hl("NeoTreeFileName", { fg = p.fg })
  hl("NeoTreeFileNameOpened", { fg = p.green, bold = true })
  hl("NeoTreeSymbolicLinkTarget", { fg = p.cyan })
  hl("NeoTreeIndentMarker", { fg = p.border })
  hl("NeoTreeExpander", { fg = p.fg_muted })
  hl("NeoTreeMessage", { fg = p.fg_muted, italic = true })
  hl("NeoTreeModified", { fg = p.orange })
  hl("NeoTreeCursorLine", { bg = p.cursorline })
  hl("NeoTreeWinSeparator", { fg = p.border, bg = p.bg_alt })

  local git = {
    Added = p.green,
    Modified = p.orange,
    Deleted = p.red,
    Renamed = p.purple,
    Staged = p.green,
    Unstaged = p.orange,
    Untracked = p.cyan,
    Ignored = p.fg_muted,
  }

  for status, color in pairs(git) do
    hl("NeoTreeGit" .. status, { fg = color })
  end

  hl("NeoTreeGitConflict", { fg = p.red, bold = true })
end

return M

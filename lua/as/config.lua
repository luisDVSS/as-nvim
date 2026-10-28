--- Configuración compartida por As-Him y As-Her.
local M = {}

M.defaults = {
  --- Atenúa las ventanas que no tienen el foco.
  dim_inactive = true,
  --- Ajustes de estilo por familia de tokens.
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = false },
    types = {},
    variables = {},
    headings = { bold = true },
  },
  --- Sobrescritura de colores por tema, p. ej. { him = { blue = "#79b8ff" } }.
  overrides = {},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
  return M.options
end

return M

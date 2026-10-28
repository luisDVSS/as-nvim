-- Archivo de prueba para As-Him / As-Her.
-- Abre con: nvim --clean --cmd "set rtp+=$PWD" -c "colorscheme as-him" examples/demo.lua

local M = {}

--- Suma dos números.
---@param a number
---@param b number
---@return number
function M.add(a, b)
  return a + b
end

function M.greet(name, opts)
  opts = opts or {}
  local greeting = opts.formal and "Buenos días" or "Hola"
  local message = string.format("%s, %s!", greeting, name)

  if opts.shout then
    message = message:upper()
  end

  for index = 1, 3 do
    io.write(("[%d] %s\n"):format(index, message))
  end

  return message
end

local config = {
  theme = "as-him",
  transparent = false,
  diagnostics = {
    enabled = true,
    severity = { "error", "warn", "info", "hint" },
  },
  numbers = { 0, 1, 2, 3, 42, 3.1416, 1e10 },
  flags = { ok = true, failed = false, missing = nil },
  pattern = "^%d+%.%d+$",
  path = "/home/luisd/proyectos/pruebas/tema_dvss",
}

local function classify(value)
  if type(value) == "table" then
    return "table"
  elseif type(value) == "string" then
    return "string"
  else
    return type(value)
  end
end

for key, value in pairs(config) do
  print(key, classify(value), tostring(value):sub(1, 40))
end

-- TODO: añadir más casos de prueba
-- FIXME: comprobar contraste en la variante clara
-- HACK: esto es solo un ejemplo
-- NOTE: los comentarios usan el color atenuado

local ok, err = pcall(function()
  error("error de ejemplo")
end)

if not ok then
  vim.notify(err, vim.log.levels.ERROR)
end

return setmetatable(M, { __index = config })

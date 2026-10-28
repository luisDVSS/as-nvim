# As-Him · As-Her

Dos colorschemes para Neovim con el mismo motor y paletas independientes:

| Tema | Variante | Comando |
|---|---|---|
| **As-Him** | oscura | `:colorscheme as-him` |
| **As-Her** | clara | `:colorscheme as-her` |

Sin transparencia: ambos temas pintan siempre su propio fondo.

Repositorio: <https://github.com/luisDVSS/as-nvim>

- Requisitos: **Neovim ≥ 0.10** (grupos `@` de Treesitter, `nvim_set_hl`).
- Sin dependencias de plugins: las integraciones solo definen grupos de resaltado.
- Compatible con terminales sin truecolor (cada color se aproxima a la paleta ANSI 0-15).

## Instalación

Con `lazy.nvim`:

```lua
{
  "luisDVSS/as-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("as").setup({})
    vim.cmd.colorscheme("as-him")
  end,
}
```

> `lazy = false` es importante: el plugin debe estar en el `runtimepath` desde
> el arranque para que `:colorscheme as-him` encuentre `colors/as-him.lua`.

Si usas **LazyVim**:

```lua
return {
  { "luisDVSS/as-nvim", lazy = false, priority = 1000 },
  { "LazyVim/LazyVim", opts = { colorscheme = "as-him" } },
}
```

Instalación manual (pack nativo de Neovim):

```sh
git clone https://github.com/luisDVSS/as-nvim \
  ~/.local/share/nvim/site/pack/themes/start/as-nvim
```

## Uso

```vim
:colorscheme as-him   " oscuro
:colorscheme as-her   " claro
```

El tema ajusta `background` automáticamente, así que plugins que dependen de
`vim.o.background` se adaptan solos.

## Configuración

Todo es opcional. Los valores por defecto:

```lua
require("as").setup({
  -- Atenúa las ventanas sin foco.
  dim_inactive = true,

  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = false },
    types = {},
    variables = {},
    headings = { bold = true },
  },

  -- Sobrescritura por tema, sin editar los archivos de paleta.
  overrides = {
    -- him = { blue = "#79b8ff" },
    -- her = { bg = "#f5f2e8" },
  },
})
```

## lualine

El plugin incluye un tema por cada variante:

```lua
require("lualine").setup({
  options = { theme = "as-him" }, -- o "as-her"
})
```

Con `theme = "auto"` también funciona: lualine toma el nombre del colorscheme
activo.

## Integraciones incluidas

| Plugin | Grupos |
|---|---|
| Treesitter | `@comment`, `@keyword`, `@function`, `@type`, `@markup.*`, … |
| LSP | `Diagnostic*`, `LspReference*`, `LspInlayHint`, `@lsp.type.*` |
| telescope.nvim | picker, preview, permisos, contador y diffs |
| gitsigns.nvim | signos, staged, word-diff, líneas virtuales y blame |
| nvim-cmp / blink.cmp | menú, tipos, iconos de tipo y documentación |
| bufferline.nvim | buffers, separadores e indicadores |
| which-key.nvim | ventana, grupos y descripciones |
| snacks.nvim | picker, notifier, dashboard, indent y explorer |
| oil.nvim | directorios, enlaces y operaciones |
| neo-tree.nvim | árbol, iconos, estado git, selección, pestañas y flotantes |
| nvim-tree.lua | árbol, iconos y estado git |
| mini.nvim | statusline, tabline, icons, files, pick, diff, indentscope, hipatterns |
| trouble.nvim | listas de diagnósticos |
| indent-blankline (ibl) | guías de indentación |
| lazy.nvim | UI del gestor de plugins |
| mason.nvim | UI de instalación de servidores |
| nvim-dap / dap-ui | breakpoints y paneles |
| nvim-notify / fidget.nvim | notificaciones y progreso LSP |
| noice.nvim | cmdline, popups, mensajes, progreso LSP y completado |
| render-markdown.nvim | encabezados, código, citas, listas, tablas y callouts |
| alpha-nvim | dashboard |
| flash.nvim, treesitter-context, navic, illuminate, rainbow-delimiters, todo-comments | grupos auxiliares |

## Paletas

### As-Him (oscura)

| Rol | Color | Contraste sobre `bg` |
|---|---|---|
| `bg` | `#2a2a2a` | — |
| `bg_alt` | `#232323` | — |
| `bg_float` | `#333333` | — |
| `fg` | `#d4d4d4` | 9.68:1 |
| `fg_muted` | `#909090` | 4.50:1 |
| `border` | `#404040` | — |
| `red` | `#e06c75` | 4.49:1 |
| `orange` | `#d19a66` | 5.83:1 |
| `yellow` | `#e5c07b` | 8.31:1 |
| `green` | `#98c379` | 7.12:1 |
| `cyan` | `#56b6c2` | 6.06:1 |
| `blue` | `#61afef` | 6.07:1 |
| `purple` | `#c678dd` | 4.87:1 |
| `pink` | `#e88fc0` | 6.23:1 |

### As-Her (clara)

| Rol | Color | Contraste sobre `bg` |
|---|---|---|
| `bg` | `#eaeaea` | — |
| `bg_alt` | `#e0e0e0` | — |
| `bg_float` | `#f4f4f4` | — |
| `fg` | `#2e2e2e` | 11.29:1 |
| `fg_muted` | `#686868` | 4.63:1 |
| `border` | `#c8c8c8` | — |
| `red` | `#ba353f` | 4.76:1 |
| `orange` | `#9b5312` | 4.80:1 |
| `yellow` | `#846400` | 4.59:1 |
| `green` | `#3a7328` | 4.77:1 |
| `cyan` | `#006d7f` | 5.00:1 |
| `blue` | `#2758b4` | 5.56:1 |
| `purple` | `#7f3ab1` | 5.55:1 |
| `pink` | `#b22c75` | 4.97:1 |

> Los acentos de As-Her se oscurecieron un 8 % respecto a la propuesta inicial
> para alcanzar el mínimo AA (4.5:1) sobre `#eaeaea`: ahora van de 4.59:1 a
> 5.56:1. Los tonos ANSI 1-6 de `:terminal` se actualizaron con ellos.

## Estructura

```
as-nvim/
├── colors/
│   ├── as-him.lua
│   └── as-her.lua
├── lua/
│   ├── as/
│   │   ├── init.lua          -- setup(), load(), lualine()
│   │   ├── builder.lua       -- acumula y aplica highlights
│   │   ├── config.lua        -- opciones compartidas
│   │   ├── util.lua          -- mezclas, contraste y cterm
│   │   ├── groups.lua        -- editor y sintaxis clásica
│   │   ├── palettes/
│   │   │   ├── him.lua
│   │   │   └── her.lua
│   │   └── integrations/     -- 20 módulos de plugins
│   └── lualine/themes/
│       ├── as-him.lua
│       └── as-her.lua
└── README.md
```

## Probar sin instalar

```sh
nvim --clean --cmd "set rtp+=$PWD" -c "colorscheme as-him"
nvim --clean --cmd "set rtp+=$PWD" -c "colorscheme as-her"
```

Con un archivo de ejemplo que ejercita comentarios, strings, números, tipos y
diagnósticos:

```sh
nvim --clean --cmd "set rtp+=$PWD" -c "colorscheme as-him" examples/demo.lua
nvim --clean --cmd "set rtp+=$PWD" -c "colorscheme as-her" examples/demo.lua
```

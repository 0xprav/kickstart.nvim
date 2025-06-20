-- idletoes.lua  ── Neovim palette + highlights  ─────────────────────────────
local M = {}

M.setup = function()
  vim.opt.termguicolors = true

  -- 16-colour IdleToes palette
  local p = {
    ['0'] = '#323232',
    ['1'] = '#d25252',
    ['2'] = '#7fe173',
    ['3'] = '#ffc66d',
    ['4'] = '#4099ff',
    ['5'] = '#f680ff',
    ['6'] = '#bed6ff',
    ['7'] = '#eeeeec',
    ['8'] = '#535353',
    ['9'] = '#f07070',
    ['10'] = '#9dff91',
    ['11'] = '#ffe48b',
    ['12'] = '#5eb7f7',
    ['13'] = '#ff9dff',
    ['14'] = '#dcf4ff',
    ['15'] = '#ffffff',
    background = '#323232',
    foreground = '#ffffff',
    cursor_bg = '#d6d6d6',
    cursor_fg = '#000000',
    selection_bg = '#5b5b5b',
    selection_fg = '#000000',
  }
  vim.g.idletoes = p -- expose if other plugins need it

  -- 16 ANSI slots (for :terminal & cterm fallback)
  for i = 0, 15 do
    vim.g['terminal_color_' .. i] = p[tostring(i)]
  end

  local hi = vim.api.nvim_set_hl

  ---------------------------------------------------------------------------
  -- Basic UI
  ---------------------------------------------------------------------------
  hi(0, 'Normal', { fg = p.foreground, bg = p.background })
  hi(0, 'NormalFloat', { fg = p.foreground, bg = p.background })
  hi(0, 'NonText', { fg = p['8'] })
  hi(0, 'Cursor', { fg = p.cursor_fg, bg = p.cursor_bg })
  hi(0, 'CursorLine', { bg = '#3a3a3a' })
  hi(0, 'CursorColumn', { bg = '#3a3a3a' })
  hi(0, 'LineNr', { fg = p['8'] })
  hi(0, 'CursorLineNr', { fg = p['7'], bold = true })
  hi(0, 'StatusLine', { fg = p.foreground, bg = '#444444' })
  hi(0, 'VertSplit', { fg = '#444444' })
  hi(0, 'Visual', { fg = p.selection_fg, bg = p.selection_bg })
  hi(0, 'Search', { fg = p.background, bg = p['3'] })

  -- pop-up / menu
  hi(0, 'Pmenu', { fg = p.foreground, bg = '#404040' })
  hi(0, 'PmenuSel', { fg = p.background, bg = p['4'] })
  hi(0, 'FloatBorder', { fg = p['4'], bg = p.background })

  ---------------------------------------------------------------------------
  -- Generic syntax
  ---------------------------------------------------------------------------
  hi(0, 'Comment', { fg = p['2'], italic = true, ctermfg = 2 })
  hi(0, 'String', { fg = p['3'], ctermfg = 3 })
  hi(0, 'Character', { link = 'String' })
  hi(0, 'Number', { fg = p['4'], ctermfg = 4 })
  hi(0, 'Boolean', { link = 'Number' })
  hi(0, 'Float', { link = 'Number' })
  hi(0, 'Identifier', { fg = p['4'], ctermfg = 4 })
  hi(0, 'Function', { link = 'Identifier' })
  hi(0, 'Operator', { fg = p['5'], ctermfg = 5 })
  hi(0, 'Keyword', { fg = p['1'], bold = true, ctermfg = 1 })
  hi(0, 'Statement', { link = 'Keyword' })
  hi(0, 'Conditional', { link = 'Keyword' })
  hi(0, 'Repeat', { link = 'Keyword' })
  hi(0, 'Label', { link = 'Keyword' })
  hi(0, 'Exception', { link = 'Keyword' })
  hi(0, 'PreProc', { fg = p['11'], ctermfg = 11 })
  hi(0, 'Include', { link = 'PreProc' })
  hi(0, 'Define', { link = 'PreProc' })
  hi(0, 'Macro', { link = 'PreProc' })
  hi(0, 'Constant', { fg = p['10'], ctermfg = 10 })
  hi(0, 'Type', { fg = p['6'], ctermfg = 6 })
  hi(0, 'StorageClass', { link = 'Type' })
  hi(0, 'Structure', { link = 'Type' })
  hi(0, 'Typedef', { link = 'Type' })
  hi(0, 'Special', { fg = p['13'], ctermfg = 13 })
  hi(0, 'Delimiter', { link = 'Special' })
  hi(0, 'Underlined', { fg = p['4'], underline = true })

  ---------------------------------------------------------------------------
  -- Diagnostics / LSP
  ---------------------------------------------------------------------------
  hi(0, 'DiagnosticError', { fg = p['9'] })
  hi(0, 'DiagnosticWarn', { fg = p['11'] })
  hi(0, 'DiagnosticInfo', { fg = p['12'] })
  hi(0, 'DiagnosticHint', { fg = p['6'] })
  hi(0, 'DiagnosticUnderlineError', { undercurl = true, sp = p['9'] })
  hi(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = p['11'] })
  hi(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = p['12'] })
  hi(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = p['6'] })

  ---------------------------------------------------------------------------
  -- Git / diff
  ---------------------------------------------------------------------------
  hi(0, 'DiffAdd', { fg = p['2'], bg = '#2f4333' })
  hi(0, 'DiffChange', { fg = p['3'], bg = '#4e4b26' })
  hi(0, 'DiffDelete', { fg = p['1'], bg = '#43302f' })
  hi(0, 'GitSignsAdd', { link = 'DiffAdd' })
  hi(0, 'GitSignsChange', { link = 'DiffChange' })
  hi(0, 'GitSignsDelete', { link = 'DiffDelete' })

  ---------------------------------------------------------------------------
  -- Treesitter capture → core group links
  ---------------------------------------------------------------------------
  local ts = {
    ['@variable'] = 'Identifier',
    ['@property'] = 'Identifier',
    ['@parameter'] = 'Identifier',
    ['@field'] = 'Identifier',
    ['@function'] = 'Function',
    ['@keyword'] = 'Keyword',
    ['@operator'] = 'Operator',
    ['@string'] = 'String',
    ['@number'] = 'Number',
    ['@comment'] = 'Comment',
    ['@type'] = 'Type',
    ['@boolean'] = 'Boolean',
    ['@constant'] = 'Constant',
  }
  for cap, link in pairs(ts) do
    hi(0, cap, { link = link })
  end
end

return M

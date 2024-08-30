return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any opts here
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below is optional, make sure to setup it properly if you have lazy=true
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
  mappings = {
    ask = '<leader>aa',
    edit = '<leader>ae',
    refresh = '<leader>ar',
    --- @class AvanteConflictMappings
    diff = {
      ours = 'co',
      theirs = 'ct',
      both = 'cb',
      next = ']x',
      prev = '[x',
    },
    jump = {
      next = ']]',
      prev = '[[',
    },
    submit = {
      normal = '<CR>',
      insert = '<C-s>',
    },
    toggle = {
      debug = '<leader>ad',
      hint = '<leader>ah',
    },
  },
}

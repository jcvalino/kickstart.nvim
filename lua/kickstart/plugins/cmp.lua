return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  opts = function(_, opts)
    local cmp = require 'cmp'

    cmp.setup {
      mapping = {
        -- Confirm completion with Enter
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm { select = true } -- Accept currently selected item
          else
            fallback() -- Default <CR> (new line)
          end
        end, { 'i', 's' }),

        -- Navigation
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
    }

    -- local cmp = require 'cmp'
    --
    -- opts.mapping = opts.mapping or {}
    --
    -- opts.mapping['<CR>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     print 'a'
    --     cmp.confirm {
    --       behavior = cmp.ConfirmBehavior.Replace,
    --       select = true,
    --     }
    --   else
    --     print 'b'
    --     fallback() -- fallback to normal Enter (newline)
    --   end
    -- end, { 'i', 's' })
    --
    -- return opts
  end,
}

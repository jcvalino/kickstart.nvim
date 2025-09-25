return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Example: TypeScript/JavaScript
    lspconfig.ts_ls.setup {
      capabilities = capabilities,
    }

    -- Example: Prisma
    lspconfig.prismals.setup {
      capabilities = capabilities,
    }

    -- Example: Tailwindcss
    lspconfig.tailwindcss.setup {
      capabilities = capabilities,
    }

    -- Example: Python
    lspconfig.pyright.setup {
      capabilities = capabilities,
    }

    -- Example: Lua
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    }
  end,
}


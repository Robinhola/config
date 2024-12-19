return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- 'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    opts = {
      servers = {
        lua_ls = {},
        ocamllsp = {},
      },
    },
    config = function(_, opts)
      -- local lspconfig = require("lspconfig")
      --
      -- for server, config in pairs(opts.servers) do
      --   config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      --   lspconfig[server].setup(config)
      -- end

      vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client:supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end
  },
}

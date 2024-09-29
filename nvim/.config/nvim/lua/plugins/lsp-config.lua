return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "bashls", "dockerls", "gopls", "helm_ls", "java_language_server", "jsonls", "grammarly", "pylsp", "tflint"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.bashls.setup({capabilities = capabilities})
      lspconfig.dockerls.setup({capabilities = capabilities})
      lspconfig.gopls.setup({capabilities = capabilities})
      lspconfig.helm_ls.setup({capabilities = capabilities})
      lspconfig.java_language_server.setup({capabilities = capabilities})
      lspconfig.jsonls.setup({capabilities = capabilities})
      lspconfig.grammarly.setup({capabilities = capabilities})
      lspconfig.pylsp.setup({capabilities = capabilities})
      lspconfig.tflint.setup({capabilities = capabilities})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}


-- ===============================
-- Neovim LSP + Mason + cmp_nvim_lsp + LuaSnip Setup
-- ===============================

local root_files = {
  '.luarc.json', '.luarc.jsonc', '.luacheckrc',
  '.stylua.toml', 'stylua.toml', 'selene.toml',
  'selene.yml', '.git',
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Core LSP + Mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- LSP completion
    "hrsh7th/cmp-nvim-lsp", -- only used for capabilities

    -- "hrsh7th/nvim-cmp",
    -- "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-path",
    -- "hrsh7th/cmp-cmdline",
    -- "saadparwaiz1/cmp_luasnip",
    
    -- "onsails/lspkind.nvim",

    -- Diagnostics / formatting
    "stevearc/conform.nvim",
    "j-hui/fidget.nvim",

    -- Utility
    "nvim-lua/plenary.nvim",
  },

  config = function()
    -- ===============================
    -- 1. Formatting via Conform
    -- ===============================
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        java = { "google-java-format" },
        cpp = { "clang-format" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        ruby = { "rubocop" },
        php = { "php-cs-fixer" },
        elixir = { "mix_format" },
        erlang = { "erlang_ls" },
      },
      format_on_save = {
        lsp_fallback = true,
        quiet = true,
        async = false,
        timeout_ms = 1000,
      },
    })
    
    

    -- Optional: Extend snippets to html/typescript from javascript
    -- luasnip.filetype_extend("html", { "javascript" })
    -- luasnip.filetype_extend("typescript", { "javascript" })
    -- require("luasnip.loaders.from_vscode").lazy_load()

    -- Key icons for LSP kinds
    local kind_icons = {
      Text = "",
       Method = "󰆧", 
       Function = "󰊕", Constructor = "",
      Field = "󰇽", Variable = "󰂡", Class = "󰠱", Interface = "",
      Module = "", Property = "󰜢", Unit = "", Value = "󰎠",
      Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
      File = "󰈙", Reference = "", Folder = "󰉋", EnumMember = "",
      Constant = "󰏿", Struct = "", Event = "", Operator = "󰆕",
      TypeParameter = "󰅲",
    }

   
    -- ===============================
    -- 2. Capabilities (from cmp)
    -- ===============================
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )


    -- ===============================
    -- 3. Mason Setup
    -- ===============================
    require("mason").setup({
      ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } },
    })

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls", "tailwindcss", "clangd", "eslint", "html",
        "ts_ls", "cssls", "emmet_language_server", "pyright"
      },
      handlers = {
        -- Default handler for all other servers
        function(server_name)
          vim.lsp.config(server_name, { capabilities = capabilities })
          vim.lsp.enable(server_name)
        end,

        -- Special configuration for lua_ls
        ["lua_ls"] = function()
          vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
              Lua = {
                format = {
                  enable = true,
                  defaultConfig = { indent_style = "space", indent_size = "2" },
                },
              },
            },
          })
          vim.lsp.enable("lua_ls")
        end,

        -- Special configuration for tailwindcss
        ["tailwindcss"] = function()
          vim.lsp.config("tailwindcss", {
            capabilities = capabilities,
            filetypes = {
              "html", "css", "scss", "javascript", "javascriptreact",
              "typescript", "typescriptreact", "vue", "svelte", "heex",
            },
          })
          vim.lsp.enable("tailwindcss")
        end,
      },
    })

    -- ===============================
    -- 4. Diagnostics
    -- ===============================
    vim.diagnostic.config({
      virtual_lines = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = { border = "rounded", source = true },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
      },
    })

    -- ===============================
    -- 5. Individual Server Example: TypeScript/JavaScript
    -- ===============================
    vim.lsp.config("ts_ls", { capabilities = capabilities })
    vim.lsp.enable("ts_ls")
  end,
}

return {
  "pmizio/typescript-tools.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },

  config = function()
    require("typescript-tools").setup({

      -- =========================
      -- Global Settings
      -- =========================
      settings = {
        separate_diagnostic_server = true, -- run a separate diagnostics server
        expose_as_code_action = "all",     -- expose TSServer commands as code actions
        tsserver_max_memory = "auto",      -- let plugin decide memory usage
        complete_function_calls = true,    -- auto-complete function args
        include_completions_with_insert_text = true,

        -- =========================
        -- Inlay Hints & Preferences
        -- =========================
        tsserver_file_preferences = {
          -- Inlay Hints
          includeInlayParameterNameHints = "all", -- "none" | "literals" | "all"
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,

          -- Completions
          includeCompletionsForModuleExports = true,
          quotePreference = "auto", -- single | double | auto

          -- autoImportFileExcludePatterns = { "node_modules/*", ".git/*" },
        },
      },
    })
  end,
}

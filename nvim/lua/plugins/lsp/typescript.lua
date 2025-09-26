return {
  "pmizio/typescript-tools.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },

  config = function()
    local ts_tools = require("typescript-tools")

    ts_tools.setup({
      settings = {
        separate_diagnostic_server = true,
        expose_as_code_action = "all",
        tsserver_max_memory = "auto",
        complete_function_calls = true,
        include_completions_with_insert_text = true,
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
          includeCompletionsForModuleExports = true,
          quotePreference = "auto",
        },
      },
    })

    -- =========================
    -- TypeScript LSP Keymaps
    -- =========================
    -- Map keys buffer-locally when LSP attaches
    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   callback = function(event)
    --     local buf = event.buf
    --     local function map(keys, func, desc)
    --       vim.keymap.set("n", keys, func, { buffer = buf, desc = "TS: " .. desc })
    --     end

    --     -- Rename symbol
    --     map("<leader>tr", ts_tools.rename, "Rename Symbol")

    --     -- Organize imports
    --     map("<leader>to", ts_tools.organize_imports, "Organize Imports")

    --     -- Add missing imports
    --     map("<leader>ta", ts_tools.add_missing_imports, "Add Missing Imports")

    --     -- Remove unused code
    --     map("<leader>tu", ts_tools.remove_unused, "Remove Unused Code")

    --     -- Fix all auto-fixable issues
    --     map("<leader>tf", ts_tools.fix_all, "Fix All")

    --     -- Go to source definition (works with type-only imports)
    --     map("<leader>td", ts_tools.go_to_source_definition, "Go To Source Definition")
    --   end,
    -- })
  end,
}

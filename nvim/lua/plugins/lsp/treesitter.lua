return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  config = function()
    require("nvim-treesitter.configs").setup({

      -- =========================
      -- Core Features
      -- =========================
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = { enable = true }, -- needs `nvim-ts-autotag`

      -- =========================
      -- Parsers to Install
      -- =========================
      ensure_installed = {
        -- "json",
        -- "javascript",
        -- "typescript",
        -- "java",
        -- "tsx",
        -- "python",
        -- "html",
        -- "css",
        -- "bash",
        -- "lua",
        -- "vim",
        -- "gitignore",
        -- "vimdoc",
        -- "prisma",
        -- "markdown",
        -- "markdown_inline",
        -- "svelte",
        -- "graphql",
        -- "dockerfile",
        -- "query",
      },
      auto_install = true,

      -- =========================
      -- Incremental Selection
      -- =========================
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },

      -- =========================
      -- Textobjects
      -- =========================
      textobjects = {

        -- -------------------------
        -- Selection
        -- -------------------------
        select = {
          enable = true,
          lookahead = true, -- like targets.vim

          keymaps = {
            -- Assignments
            ["a="] = { query = "@assignment.outer", desc = "Outer assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Inner assignment" },
            ["l="] = { query = "@assignment.lhs",   desc = "Assignment LHS" },
            ["r="] = { query = "@assignment.rhs",   desc = "Assignment RHS" },

            -- Properties (JS/TS)
            ["a:"] = { query = "@property.outer", desc = "Outer property" },
            ["i:"] = { query = "@property.inner", desc = "Inner property" },
            ["l:"] = { query = "@property.lhs",   desc = "Property LHS" },
            ["r:"] = { query = "@property.rhs",   desc = "Property RHS" },

            -- Parameters
            ["aa"] = { query = "@parameter.outer", desc = "Outer parameter" },
            ["ia"] = { query = "@parameter.inner", desc = "Inner parameter" },

            -- Loops
            ["al"] = { query = "@loop.outer", desc = "Outer loop" },
            ["il"] = { query = "@loop.inner", desc = "Inner loop" },

            -- Functions
            ["af"] = { query = "@call.outer", desc = "Outer function call" },
            ["if"] = { query = "@call.inner", desc = "Inner function call" },
            ["am"] = { query = "@function.outer", desc = "Outer function def" },
            ["im"] = { query = "@function.inner", desc = "Inner function def" },

            -- Classes
            ["ac"] = { query = "@class.outer", desc = "Outer class" },
            ["ic"] = { query = "@class.inner", desc = "Inner class" },
          },
        },

        -- -------------------------
        -- Swap
        -- -------------------------
        swap = {
          enable = true,
          swap_next = {
            ["<leader>na"] = "@parameter.inner",
            ["<leader>nm"] = "@function.outer",
            ["<leader>n:"] = "@property.outer",
          },
          swap_previous = {
            ["<leader>pa"] = "@parameter.inner",
            ["<leader>pm"] = "@function.outer",
            ["<leader>p:"] = "@property.outer",
          },
        },

        -- -------------------------
        -- Movement
        -- -------------------------
        move = {
          enable = true,
          set_jumps = true, -- add to jumplist

          goto_next_start = {
            ["[f"] = { query = "@call.outer",      desc = "Next function call start" },
            ["[m"] = { query = "@function.outer", desc = "Next function def start" },
            ["[c"] = { query = "@class.outer",    desc = "Next class start" },
            ["[i"] = { query = "@conditional.outer", desc = "Next conditional start" },
            ["[l"] = { query = "@loop.outer",     desc = "Next loop start" },
            ["[s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["[z"] = { query = "@fold",  query_group = "folds",  desc = "Next fold" },
          },
          goto_next_end = {
            ["[F"] = { query = "@call.outer",      desc = "Next function call end" },
            ["[M"] = { query = "@function.outer", desc = "Next function def end" },
            ["[C"] = { query = "@class.outer",    desc = "Next class end" },
            ["[I"] = { query = "@conditional.outer", desc = "Next conditional end" },
            ["[L"] = { query = "@loop.outer",     desc = "Next loop end" },
          },
          goto_previous_start = {
            ["]f"] = { query = "@call.outer",      desc = "Prev function call start" },
            ["]m"] = { query = "@function.outer", desc = "Prev function def start" },
            ["]c"] = { query = "@class.outer",    desc = "Prev class start" },
            ["]i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
            ["]l"] = { query = "@loop.outer",     desc = "Prev loop start" },
          },
          goto_previous_end = {
            ["]F"] = { query = "@call.outer",      desc = "Prev function call end" },
            ["]M"] = { query = "@function.outer", desc = "Prev function def end" },
            ["]C"] = { query = "@class.outer",    desc = "Prev class end" },
            ["]I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
            ["]L"] = { query = "@loop.outer",     desc = "Prev loop end" },
          },
        },
      },
    })
  end,
}

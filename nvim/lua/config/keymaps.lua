-- ========================================
-- Neovim Keymaps & Custom Commands
-- ========================================

-- local wk = require("which-key")

-- ===============================
-- 0. Leader Key
-- ===============================
vim.g.mapleader = " " -- Change leader to space

-- ===============================
-- 1. General Normal Mode Mappings
-- ===============================
-- Save, quit, and buffer navigation
vim.keymap.set("n", "<leader><CR>", ":update<CR>", { noremap = true, silent = true, desc = "Save File" })
vim.keymap.set("n", "<C-q>", ":q!<CR>", { noremap = true, silent = true, desc = "Quit without saving" })
vim.keymap.set("n", "<tab>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
-- vim.keymap.set("n", "<C-n>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<C-b>", ":bprev<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true, desc = "Close Buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close buffer but retain split" })
vim.keymap.set("n", "<leader>bo", "<cmd>w <bar> %bd <bar> e# <bar> bd#<CR>", { desc = "Close all other buffers" })

-- Navigation
vim.keymap.set("n", "==", "gg<S-v>G", { desc = "Select all" })
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })



-- Line movement
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search match, center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search match, center" })

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dp', { desc = "Paste without overwriting register" })
vim.keymap.set("v", "P", '"_dP', { desc = "Paste before without overwriting register" })

-- Delete without yank
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete character without yank" })

-- Add empty line
vim.keymap.set("n", "<C-w>", "o<Esc>", { noremap = true, silent = true, desc = "Add empty line below" })

-- Splits
vim.keymap.set("", "<leader>vv", "<C-w>v", { noremap = true, desc = "Vertical Split" })
vim.keymap.set("", "<leader>hh", "<C-w>s", { noremap = true, desc = "Horizontal Split" })
vim.keymap.set("", "<leader>vs", "<C-w>t<C-w>H", { noremap = true, desc = "Convert 2 splits vertical->horizontal" })
vim.keymap.set("", "<leader>hs", "<C-w>t<C-w>K", { noremap = true, desc = "Convert 2 splits horizontal->vertical" })

-- Resize splits
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- Refactoring / Search & Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

-- Format current buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })

-- Lazygit
vim.keymap.set("n", "<C-e>", "<cmd>LazyGit<CR>", { noremap = true, silent = true, desc = "Open LazyGit" })

-- ===============================
-- 2. Insert Mode Mappings
-- ===============================
vim.keymap.set("i", "kk", "<Esc>", { noremap = true, desc = "Exit insert mode" })
vim.keymap.set("i", "jj", "<Esc>:w<CR>", { noremap = true, desc = "Exit insert mode & save" })
vim.keymap.set("i", "<C-f>", "<ESC>o", { noremap = true, silent = true, desc = "Insert new line below" })
vim.keymap.set("i", "<C-e>", "<ESC>A", { noremap = true, silent = true, desc = "Go to end of line" })

-- ===============================
-- 3. Visual Mode Mappings
-- ===============================
-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- ===============================
-- 4. Custom Commands
-- ===============================
vim.api.nvim_create_user_command("Js", function()
  local filename = vim.fn.expand("%")
  if filename == "" then return print("No file open") end
  vim.cmd("!node " .. vim.fn.shellescape(filename))
end, {})

vim.api.nvim_create_user_command("Ts", function()
  local filename = vim.fn.expand("%")
  if filename == "" then return print("No file open") end
  if not filename:match("%.ts$") then return print("Not a TypeScript file") end
  vim.cmd("!ts-node " .. vim.fn.shellescape(filename))
end, {})

-- Add line above
vim.keymap.set("n", "[<leader>", function()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  vim.api.nvim_buf_set_lines(0, line, line, true, { "" })
  vim.api.nvim_input("<up>")
end, { desc = "Add line above" })

-- Add line below
vim.keymap.set("n", "]<leader>", function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, line, line, true, { "" })
  vim.api.nvim_input("<down>")
end, { desc = "Add line below" })

-- Swap 0 and ^
vim.keymap.set("n", "0", "^", { desc = "Go to first character of line" })
vim.keymap.set("n", "^", "0", { desc = "Go to start of line" })

-- ===============================
-- 5. Which-Key Custom Shortcuts
-- ===============================

-- ========================================
-- LSP Keymaps and Hover Configuration
-- Triggered automatically when an LSP client attaches
-- ========================================

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    -- Helper function to map keys with descriptions
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- ===============================
    -- 1. Telescope LSP Navigation
    -- ===============================

    -- Telescope built-in functions
    local builtin = require("telescope.builtin")

    -- =============================
    -- File & Buffer Search
    -- =============================
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind Existing [B]uffers" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find Git-tracked Files" })
    vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<C-g>", builtin.oldfiles, { desc = "Open Recently Used Files" })
    map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
    map("gr", require("telescope.builtin").lsp_references, "Goto References")
    map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
    map("go", require("telescope.builtin").lsp_type_definitions, "Type Definition")
    map("<leader>p", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
    map("<leader>P", require("telescope.builtin").lsp_workspace_symbols, "Workspace Symbols")
    map("<leader>Ps", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Dynamic Workspace Symbols")

    -- =============================
    -- Search in Project / Diagnostics
    -- =============================
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })

    -- Search for a user-input string in the project
    vim.keymap.set("n", "<leader>fg", function()
      local query = vim.fn.input("Grep > ")
      builtin.grep_string({ search = query })
    end, { desc = "[F]ind by [G]rep (input)" })

    -- Search for the word under the cursor
    vim.keymap.set("n", "<leader>pws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, { desc = "Search for word under cursor (small word)" })

    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "Search for WORD under cursor (big word)" })

    -- Search in a specific directory (example: your dotfiles)
    -- vim.keymap.set(
    --   "n",
    --   "<leader>;",
    --   function()
    --     builtin.find_files({ cwd = "~/dotfiles/nvim/" })
    --   end,
    --   { desc = "Find Files in Neovim Dotfiles", noremap = true, silent = true }
    -- )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>;",
      [[<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand("~/dotfiles/nvim/") })<CR>]],
      { noremap = true, silent = true }
    )


    -- ===============================
    -- 2. LSP Hover and Signature
    -- ===============================
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single", -- border style
      max_width = 80,
      max_height = 30,
      width = 60,
      height = 8,
    })
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("gs", vim.lsp.buf.signature_help, "Signature Documentation")

    -- ===============================
    -- 3. Diagnostics
    -- ===============================
    map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
    map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
    map("]d", vim.diagnostic.goto_next, "Next Diagnostic")

    -- ===============================
    -- 4. Declaration / Vertical Split
    -- ===============================
    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", "Goto Definition in Vertical Split")

    -- ===============================
    -- 5. Which-Key Integration for LSP Actions
    -- ===============================
    -- wk.add({
    -- -- Code Actions
    -- ["<leader>la"] = { vim.lsp.buf.code_action, "Code Action" },
    -- ["<leader>lA"] = { vim.lsp.buf.range_code_action, "Range Code Actions" },

    -- Signature / Hover
    -- ["<leader>ls"] = { vim.lsp.buf.signature_help, "Display Signature Information" },

    -- Rename / Format
    -- ["<leader>lr"] = { vim.lsp.buf.rename, "Rename all references" },
    -- ["<leader>lf"] = { vim.lsp.buf.format, "Format" },

    -- Implementation / Diagnostics
    -- ["<leader>li"] = { require("telescope.builtin").lsp_implementations, "Implementation" },
    -- ["<leader>lw"] = { require("telescope.builtin").diagnostics, "Diagnostics" },

    -- Workspace Management
    -- ["<leader>Wa"] = { vim.lsp.buf.add_workspace_folder, "Workspace Add Folder" },
    -- ["<leader>Wr"] = { vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder" },
    -- ["<leader>Wl"] = {
    --   function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --   end,
    --   "Workspace List Folders",
    -- },
    -- })
  end,
})

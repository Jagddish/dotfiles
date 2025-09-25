return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind_ok, lspkind = pcall(require, "lspkind")


    -- ===============================
    -- 2. Completion Options
    -- ===============================
    vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }
    vim.opt.shortmess:append("c")

        -- Key icons for LSP kinds
    local kind_icons = {
      Text = "", Method = "󰆧", Function = "󰊕", Constructor = "",
      Field = "󰇽", Variable = "󰂡", Class = "󰠱", Interface = "",
      Module = "", Property = "󰜢", Unit = "", Value = "󰎠",
      Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
      File = "󰈙", Reference = "", Folder = "󰉋", EnumMember = "",
      Constant = "󰏿", Struct = "", Event = "", Operator = "󰆕",
      TypeParameter = "󰅲",
    }

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      window = {
        completion = { border = "rounded", winhighlight = "Normal:CmpNormal" },
        documentation = { border = "rounded", winhighlight = "Normal:CmpDocNormal" },
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   elseif luasnip.jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = {  "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          if lspkind_ok then
            return lspkind.cmp_format()(entry, vim_item)
          else
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end
        end,
      },

      -- for noice plugin 
      cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "cmdline" },
					},
				}),
    })
  end,
}

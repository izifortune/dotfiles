-- vim.o.completeopt = "menu,menuone,noselect"
-- Setup nvim-cmp.

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
    -- completeopt = 'menu,menuone,noselect',
  },
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<A-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping(function(fallback)
      if (vim.fn["vsnip#available"](1) == 1 and vim.fn["vsnip#jumpable"](1) ~= 1)  then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif (vim.fn["vsnip#available"](1) == 1 and vim.fn["vsnip#jumpable"](1) == 1)  then
        feedkey("<Plug>(vsnip-jump-next)", "")
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<C-h>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- ['<C-y>'] = cmp.mapping.confirm({
    --   behaviour = cmp.ConfirmBehavior.Insert,
    --   select = true
    -- })
    -- ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
  },
  sources = {
    { name = 'nvim_lsp' },

    -- For vsnip user.
    { name = 'vsnip' },

    { name = 'orgmode' },

    -- For luasnip user.
    -- { name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },
    { name = 'path' },

    { name = 'buffer' },
    -- { name = 'calc' }
  },
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
})

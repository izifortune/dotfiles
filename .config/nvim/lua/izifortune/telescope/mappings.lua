local map_tele = function(key, f, options, buffer)
  local mode = "n"
  local rhs = string.format(
  "<cmd>lua R('izifortune.telescope')['%s'](%s)<CR>",
  f,
  options and vim.inspect(options, { newline = '' }) or ''
  )
  local options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, options)
  end
end

vim.api.nvim_set_keymap('c', '<c-r><c-r>', '<Plug>(TelescopeFuzzyCommandSearch)', { noremap = false, nowait = true })

-- Dotfiles
map_tele('<leader>en', 'edit_neovim')
map_tele('<leader>ez', 'edit_zsh')

-- Search
map_tele('<leader>fw', 'grep_string', {
  short_path = true,
  word_match = '-w',
  only_sort_text = true
})

-- Files
map_tele('<C-g>', 'project_files')
map_tele('<C-p>', 'find_files')
map_tele('<leader>fg', 'live_grep')
map_tele('<leader>sz', 'search_zettel')
map_tele('<leader>lz', 'link_zettel')
map_tele('<leader>st', 'search_todos')
map_tele('<leader>ss', 'search_tags')
map_tele('<leader>fo', 'oldfiles')
map_tele('<leader>fd', 'file_browser')
-- map_tele('<leader>pp', 'project_search')

-- Nvim
map_tele('<leader>fb', 'buffers')
map_tele('<leader>fp', 'my_plugins')
map_tele('<leader>fa', 'installed_plugins')
map_tele('<leader>fi', 'search_all_files')
map_tele('<leader>ff', 'curbuf')
map_tele('<leader>fh', 'help_tags')
map_tele('<leader>so', 'vim_options')
map_tele('<leader>gp', 'grep_prompt')
map_tele('<leader>fc', 'command_history')
map_tele('<leader>fs', 'symbols')
map_tele('<leader>fu', 'ultisnips')


-- Telescope Meta
map_tele('<leader>fB', 'builtin')

return map_tele

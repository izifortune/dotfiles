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
map_tele('<C-g>', 'git_files')
map_tele('<C-p>', 'find_files')
map_tele('<space>fg', 'live_grep')
map_tele('<leader>sz', 'search_zettel')
map_tele('<leader>st', 'search_todos')
map_tele('<space>fo', 'oldfiles')
map_tele('<space>fd', 'fd')
-- map_tele('<space>pp', 'project_search')

-- Nvim
map_tele('<space>fb', 'buffers')
map_tele('<space>fp', 'my_plugins')
map_tele('<space>fa', 'installed_plugins')
map_tele('<space>fi', 'search_all_files')
map_tele('<space>ff', 'curbuf')
map_tele('<space>fh', 'help_tags')
map_tele('<space>so', 'vim_options')
map_tele('<space>gp', 'grep_prompt')
map_tele('<space>fc', 'command_history')
map_tele('<space>fs', 'symbols')
map_tele('<space>fu', 'ultisnips')


-- Telescope Meta
map_tele('<space>fB', 'builtin')

return map_tele

local should_reload = true
local reloader = function()
  if should_reload then
    RELOAD('plenary')
    RELOAD('popup')
    RELOAD('telescope')
  end
end

reloader()

local actions = require('telescope.actions')
local action_state = require("telescope.actions.state")
local sorters = require('telescope.sorters')
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local themes = require('telescope.themes')
local conf = require('telescope.config').values
local make_entry = require('telescope.make_entry')
local previewers   = require('telescope.previewers')

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = table.getn(picker:get_multi_selection())

  if num_selections > 1 then
    -- actions.file_edit throws - context of picker seems to change
    --actions.file_edit(prompt_bufnr)
    actions.send_selected_to_qflist(prompt_bufnr)
    actions.open_qflist()
  else
    actions.file_edit(prompt_bufnr)
  end
end

require('telescope').setup {
  defaults = {
    prompt_prefix = ' >',

    winblend = 0,

    layout_strategy = 'flex',

    layout_config = {
      prompt_position = "top",
      preview_cutoff = 120,
      -- horizontal = {
      --   width_padding = 0.1,
      --   height_padding = 0.1,
      --   preview_width = 0.6,
      -- },
      -- vertical = {
      --   width_padding = 0.05,
      --   height_padding = 1,
      --   preview_height = 0.5,
      -- }
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,

    mappings = {
    i = {
      ["<C-n>"] = actions.move_selection_next,
      ["<C-p>"] = actions.move_selection_previous,

      ["<C-c>"] = actions.close,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,

      ["<CR>"] = custom_actions.fzf_multi_select,

      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<A-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      ["<C-l>"] = actions.complete_tag
    },

    n = {
      ["<esc>"] = actions.close,
      ["<CR>"] = custom_actions.fzf_multi_select,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

      -- TODO: This would be weird if we switch the ordering.
      ["j"] = actions.move_selection_next,
      ["k"] = actions.move_selection_previous,
      ["H"] = actions.move_to_top,
      ["M"] = actions.move_to_middle,
      ["L"] = actions.move_to_bottom,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
    },
    },

    borderchars = {
      { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    },

    file_sorter = sorters.get_fzy_sorter,

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },

    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 2,
      use_highlighter = true,
    }
  },
}

-- Load the fzy native extension at the start.
pcall(require('telescope').load_extension, 'fzy_native')
pcall(require('telescope').load_extension, 'frecency')
pcall(require('telescope').load_extension, 'octo')
pcall(require('telescope').load_extension, 'projects')
-- pcall(require('telescope').load_extension, 'ultisnips')
require"telescope".load_extension("frecency")
require("telescope").load_extension("file_browser")

local M = {}

--[[
lua require('plenary.reload').reload_module("my_user.tele")
nnoremap <leader>en <cmd>lua require('my_user.tele').edit_neovim()<CR>
--]]
function M.edit_neovim()
  require('telescope.builtin').find_files {
    prompt_title = "~ dotfiles ~",
    path_display = {
      'shorten'
    },
    cwd = "~/.config/nvim",

    layout_strategy = 'flex'
  }
end

function M.search_todos(opts)

  require('telescope.builtin').grep_string {
    path_display = {
      'shorten'
    },
    cwd='/Users/fortunatof/code/knowledge/content/diary',
    -- search_dirs = { '~/code/knowledge/content/diary' },
    sorting_strategy = 'ascending',
    vimgrep_arguments = {  'rg',
    '--sortr=created',
    '--color=never',
    '--no-heading',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case' },
    -- vimgrep_arguments = { '--sortr created' },
    search = '[ ]',
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<C-t>', function(bufnr, test)
        local content = require('telescope.actions.state').get_selected_entry(bufnr)
        -- print(vim.inspect(content))
        print(content['col'])
        print(content['filename'])
        -- vim.api.execute('e ' .. content['filename'])

      end)
      map('i', '<CR>', function(bufnr, test)
        local content = require('telescope.actions.state').get_selected_entry(bufnr)
        vim.api.nvim_command('cd /Users/fortunatof/code/knowledge/content/diary')
        custom_actions.fzf_multi_select(bufnr)
        -- vim.api.execute('e ' .. content['filename'])
      end)
      map('n', '<CR>', function(bufnr, test)
        local content = require('telescope.actions.state').get_selected_entry(bufnr)
        vim.api.nvim_command('cd /Users/fortunatof/code/knowledge/content/diary')
        custom_actions.fzf_multi_select(bufnr)
        -- vim.api.execute('e ' .. content['filename'])
      end)
      return true
    end
  }

end

function M.search_zettel(opts)

  require('telescope.builtin').grep_string {
    path_display = {
      'shorten'
    },
    -- cwd='diary',
    cwd='/Users/fortunatof/code/knowledge/content/zettelkasten',
    -- search_dirs = {'~/code/knowledge/content/zettelkasten'},
    sorting_strategy = 'ascending',
    vimgrep_arguments = {  'rg',
    '--sortr=created',
    '--color=never',
    '--no-heading',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case' },
    search = '#'
  }


  -- results = vim.fn.systemlist('rg  "^#[a-z].*"')
  --
  -- pickers.new(
  -- opts,
  -- {
  --   -- prompt = "Zettel",
  --   -- finder = finders.new_table(
  --   --   results,
  --   --   make_entry.gen_from_vimgrep()
  --   -- ),
  --   --
  --   prompt = "Zettel",
  --   finder = finders.new_oneshot_job(
  --   { 'rg --sortr created --no-heading --files-with-matches "\\[ \\]"' }
  --   ),
  --   -- attach_mappings = function(prompt_bufnr, map)
  --   --   local execute = function()
  --   --     local selection = actions.get_selected_entry(prompt_bufnr)
  --   --     actions.close(prompt_bufnr)
  --   --     local val = selection.value
  --   --     local branchname = val:gsub("remotes/origin/", "")
  --   --     local cmd = "!git checkout " .. branchname
  --   --
  --   --     vim.api.nvim_exec(cmd, true)
  --   --   end
  --   --
  --   --   map("i", "<CR>", execute)
  --   --   map("n", "<CR>", execute)
  --   --
  --   --   return true
  --   -- end,
  --   sorter = sorters.get_generic_fuzzy_sorter()
  -- }
  -- ):find()
end

function M.search_tags(opts)

  require('telescope.builtin').grep_string {
    path_display = {
      'shorten'
    },
    -- cwd='diary',
    cwd='/Users/fortunatof/code/knowledge/content',
    -- search_dirs = {'~/code/knowledge/content/zettelkasten'},
    sorting_strategy = 'ascending',
    vimgrep_arguments = {  'rg',
    '--sortr=created',
    '--color=never',
    '--no-heading',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case' },
    search = '#'
  }
end

function M.link_zettel(opts)
  opts = opts or {}

  pickers.new(
  opts,
  {
    prompt = "Link zettel",
    cwd='/Users/fortunatof/code/knowledge/content/zettelkasten',
    finder = finders.new_oneshot_job({'rg', '^#[a-z]'}),
    previewer = previewers.vim_buffer_vimgrep.new(opts),
    attach_mappings = function(prompt_bufnr, map)
      -- local execute = function()
      --   local selection = actions.get_selected_entry(prompt_bufnr)
      --   actions.close(prompt_bufnr)
      --   local val = selection.value
      --   local branchname = val:gsub("remotes/origin/", "")
      --   local cmd = "!git checkout " .. branchname
      --
      --   vim.api.nvim_exec(cmd, true)
      -- end
      --
      -- map("i", "<CR>", execute)
      -- map("n", "<CR>", execute)
      --
      return true
    end,
    sorter = sorters.get_generic_fuzzy_sorter()
  }
  ):find()
end

function M.gitBranches(opts)
  opts = opts or {}

  pickers.new(
  opts,
  {
    prompt = "Git Branches",
    finder = finders.new_oneshot_job({"git", "branch", "--list", "--all"}, opts),
    attach_mappings = function(prompt_bufnr, map)
      local execute = function()
        local selection = actions.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)
        local val = selection.value
        local branchname = val:gsub("remotes/origin/", "")
        local cmd = "!git checkout " .. branchname

        vim.api.nvim_exec(cmd, true)
      end

      map("i", "<CR>", execute)
      map("n", "<CR>", execute)

      return true
    end,
    sorter = sorters.get_generic_fuzzy_sorter()
  }
  ):find()
end

-- function M.search_zettel()
--
--   files.live_grep = function(opts)
--     local vimgrep_arguments = opts.vimgrep_arguments or conf.vimgrep_arguments
--     local search_dirs = opts.search_dirs
--     opts.cwd = opts.cwd and vim.fn.expand(opts.cwd)
--
--     if search_dirs then
--       for i, path in ipairs(search_dirs) do
--         search_dirs[i] = vim.fn.expand(path)
--       end
--     end
--
--     local live_grepper = finders.new_job(function(prompt)
--       -- TODO: Probably could add some options for smart case and whatever else rg offers.
--
--       if not prompt or prompt == "" then
--         return nil
--       end
--
--       prompt = escape_chars(prompt)
--
--       return flatten { vimgrep_arguments, prompt, opts.search_dirs or '.' }
--     end,
--     opts.entry_maker or make_entry.gen_from_vimgrep(opts),
--     opts.max_results,
--     opts.cwd
--     )
--
--     pickers.new(opts, {
--       prompt_title = 'Zettel',
--       finder = live_grepper,
--       previewer = conf.grep_previewer(opts),
--       sorter = conf.generic_sorter(opts),
--     }):find()
--   end
--     prompt_title = "~ zettelkasten ~",
--     find_command = { 'rg', '--smart-case', '--', '"^#[a-z].*"'},
--     path_display = true,
--     cwd = "~/code/knowledge/content/zettelkasten",
--     width = .25,
--
--     layout_strategy = 'horizontal',
--     layout_config = {
--       preview_width = 0.65,
--     },
--   }
-- end

function M.edit_zsh()
  require('telescope.builtin').find_files {
    path_display = {
      'shorten'
    },
    cwd = "~/.config/zsh/",
    prompt = "~ dotfiles ~",

    layout_strategy = 'flex',
  }
end


function M.fd()
  require('telescope.builtin').fd()
end

function M.builtin()
  require('telescope.builtin').builtin()
end

function M.git_files()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    path_display = {
      'shorten'
    },
  }

  require('telescope.builtin').git_files(opts)
end

function M.lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    path_display = {
      'shorten'
    },
  }

  require('telescope.builtin').lsp_code_actions(opts)
end

-- not working now
-- function M.live_grep()
--  require('telescope').extensions.fzf_writer.staged_grep {
--     path_display = {
--       'shorten'
--     },
--    previewer = false,
--    fzf_separator = "|>",
--  }
-- end

function M.grep_prompt()
  require('telescope.builtin').grep_string {
    path_display = {
      'shorten'
    },
    search = vim.fn.input("Grep String > "),
  }
end

function M.oldfiles()
  if pcall(require('telescope').load_extension, 'frecency') then
    require('telescope').extensions.frecency.frecency()
  else
    require('telescope.builtin').oldfiles { layout_strategy = 'flex' }
  end
end

function M.my_plugins()
  require('telescope.builtin').find_files {
    cwd = '~/plugins/',
  }
end

function M.installed_plugins()
  require('telescope.builtin').find_files {
    cwd = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
  }
end

function M.project_search()
  require('telescope.builtin').find_files {
    previewer = false,
    layout_strategy = "flex",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

function M.buffers()
  require('telescope.builtin').buffers {
  }
end

function M.curbuf()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,

    -- layout_strategy = 'current_buffer',
  }
  require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

function M.help_tags()
  require('telescope.builtin').help_tags {
    show_version = true,
  }
end

function M.search_all_files()
  require('telescope.builtin').find_files {
    find_command = { 'rg', '--no-ignore', '--files', },
  }
end

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    if M[k] then
      return M[k]
    else
      return require('telescope.builtin')[k]
    end
  end
})

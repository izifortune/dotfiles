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
local sorters = require('telescope.sorters')
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local themes = require('telescope.themes')
local conf = require('telescope.config').values
local make_entry = require('telescope.make_entry')

require('telescope').setup {
  defaults = {
    prompt_prefix = ' >',

    winblend = 0,
    preview_cutoff = 120,

    layout_strategy = 'horizontal',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    prompt_position = "top",
    color_devicons = true,

    mappings = {
      i = {
        ["<C-x>"] = false,
        -- ["<C-s>"] = actions.goto_file_selection_split,

        -- Experimental
        ["<tab>"] = actions.toggle_selection,
        -- ["<esc>"] = actions.close,

        ["<C-q>"] = actions.send_to_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist,
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
      use_highlighter = false,
      minimum_grep_characters = 4,
    }
  },
}

-- Load the fzy native extension at the start.
pcall(require('telescope').load_extension, 'fzy_native')
pcall(require('telescope').load_extension, 'frecency')
pcall(require('telescope').load_extension, 'octo')

local M = {}

--[[
lua require('plenary.reload').reload_module("my_user.tele")
nnoremap <leader>en <cmd>lua require('my_user.tele').edit_neovim()<CR>
--]]
function M.edit_neovim()
  require('telescope.builtin').find_files {
    prompt_title = "~ dotfiles ~",
    shorten_path = true,
    cwd = "~/.config/nvim",
    width = .25,

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

function M.search_todos(opts)

  require('telescope.builtin').grep_string {
    shorten_path = true,
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
      return true
    end
  }

end

function M.search_zettel(opts)

  require('telescope.builtin').grep_string {
    shorten_path = true,
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
--     shorten_path = true,
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
    shorten_path = false,
    cwd = "~/.config/zsh/",
    prompt = "~ dotfiles ~",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.55,
    },
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
    shorten_path = false,
  }

  require('telescope.builtin').git_files(opts)
end

function M.lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require('telescope.builtin').lsp_code_actions(opts)
end

function M.live_grep()
 require('telescope').extensions.fzf_writer.staged_grep {
   shorten_path = true,
   previewer = false,
   fzf_separator = "|>",
 }
end

function M.grep_prompt()
  require('telescope.builtin').grep_string {
    shorten_path = true,
    search = vim.fn.input("Grep String > "),
  }
end

function M.oldfiles()
  if pcall(require('telescope').load_extension, 'frecency') then
    require('telescope').extensions.frecency.frecency()
  else
    require('telescope.builtin').oldfiles { layout_strategy = 'vertical' }
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
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

function M.buffers()
  require('telescope.builtin').buffers {
    shorten_path = false,
  }
end

function M.curbuf()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,

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

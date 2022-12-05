-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = '80'
vim.wo.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'
vim.o.background = 'dark'
vim.o.t_Co = 256
vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme pywal]]
-- Enable telescope theme
---- Example config in Lua
-- vim.g.gruvbox_baby_function_style = "NONE"
-- vim.g.gruvbox_baby_keyword_style = "NONE"
-- vim.g.gruvbox_baby_telescope_theme = 1

-- Enable transparent mode
-- vim.g.gruvbox_baby_transparent_mode = 1

-- Load the colorscheme
-- vim.cmd[[colorscheme gruvbox-baby]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.cmdheight = 1

vim.o.ruler = true

vim.o.hlsearch = true
vim.o.clipboard = 'unnamedplus'

-- Default spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.smartindent = true

-- Global statusline
vim.o.laststatus = 3

vim.o.swapfile = false

-- treat dash as separte words
vim.opt.iskeyword:append("-")

local Job = require'plenary.job'

vim.api.nvim_create_user_command(
  'Testing',
  function(input)
    print(input)

    Job:new({
      command = 'rg',
      args = { '--files' },
      on_stdout = function()
        print('oput')
      end,
      on_exit = function(j, return_val)
        print(return_val)
        print(j:result())
      end,
    }):start() -- or start()
  end,
  {bang = true, desc = 'Search projects folder'}
)

-- Fast redraw
vim.o.ttyfast = true

-- Remove calendar mappings
vim.g.calendar_no_mappings = true


-- Height of the suggestion popup
vim.o.pumheight = 15

-- Disable netrw gx mapping
vim.g.netrw_nogx = 1

vim.cmd[[
augroup filetypedetect
au! BufReadPre,BufReadPost,BufRead,BufNewFile *.feature setfiletype cucumber
augroup END
]]

vim.cmd[[
augroup filetypedetect
au! BufReadPre,BufReadPost,BufRead,BufNewFile *.md set syntax=markdown
augroup END
]]

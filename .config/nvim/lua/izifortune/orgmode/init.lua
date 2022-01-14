require('orgmode').setup({
  org_agenda_files = {'~/code/org/**/*'},
  org_agenda_templates =
  {
    r = { description = 'Report', template = '* %?%<%Y-%m-%d>\n [%<%Y-%m-%d>]', target = '~/code/org/report.org' },
    -- j = { description = 'Meeting notes', template = '\n* %? [%<%Y-%m-%d>] \n\n	|What|Who|When|State|', target = '~/code/org/%<%Y-%m-%d>.org' }
    t = { description = 'Task', template = '* TODO %?' },
    j = { description = 'Meeting notes', template = '\n* %? [%<%Y-%m-%d>] \n\n	|What|Who|When|State|', target = '~/code/org/meetings.org' }
  },
  org_default_notes_file = '~/code/org/todos.org',
  org_todo_keywords = {
    'TODO','WAITING', 'PENDING', '|', 'DONE', 'DELEGATED'
  },
  org_agenda_min_height = 60,
  mappings = {
    capture = {
      org_capture_finalize = '<Leader>w',
      org_capture_refile = 'R',
      org_capture_kill = 'Q'
    },
    org = {
      org_cycle = '<Leader>cf',
      org_global_cycle = '<Leader>ca',
      org_toggle_checkbox = '<leader>ct'
    }
  }
})

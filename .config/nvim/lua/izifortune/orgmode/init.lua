require('orgmode').setup({
  org_agenda_files = {'~/code/org/*'},
  org_agenda_templates =
  { j = { description = 'Report', template = '* %?%<%Y-%m-%d>\n [%<%Y-%m-%d>]', target = '~/code/org/report.org' } },
  org_default_notes_file = '~/code/org/todos.org',
  org_todo_keywords = {
    'TODO','WAITING', '|', 'DONE', 'DELEGATED'
  },
  org_agenda_min_height = 60,
  mappings = {
    capture = {
      org_capture_finalize = '<Leader>w',
      org_capture_refile = 'R',
      org_capture_kill = 'Q'
    }
  }
})

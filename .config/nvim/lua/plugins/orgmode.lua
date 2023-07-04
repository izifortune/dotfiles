return {
  "nvim-orgmode/orgmode",
  config = function()
    require("orgmode").setup_ts_grammar()
    require("orgmode").setup({
      org_agenda_files = { "~/code/org/**/*", "~/OneDrive - Ryanair Ltd/frontend/monthly/*" },
      org_agenda_templates = {
        r = {
          description = "Frontend Report",
          template = [[
** FE Standup %<%Y-%m-%d>
*** Frontend report %<%Y-%m-%d>
*** Manager Report
*** Highlights
*** Report
| What | Who | Status |
*** AT Coverage
]],
          target = "~/code/org/report.org",
        },
        m = {
          description = "Monthly Report",
          template = [[
*** %? <%Y-%m>
*** Vitals
*** Frontend report <%Y-%m-%d>
*** Manager Report
*** Highlights
*** Report
| What | Who | Status |
]],
          target = "~/code/org/report.org",
        },
        t = { description = "Task", template = "* TODO %?\n" },
        j = {
          description = "Meeting notes",
          template = [[
* %? %<%Y-%m-%d>
** Discussion
** Actions
]],
          target = "~/code/org/meetings.org",
        },
      },
      org_default_notes_file = "~/code/org/todos.org",
      org_todo_keywords = {
        "TODO",
        "PROGRESS",
        "|",
        "DONE",
        "HOLD",
        "WAITING",
        "CANCELLED",
      },
      org_agenda_min_height = 60,
      org_indent_mode = "noindent",
      mappings = {
        capture = {
          org_capture_finalize = "<Leader>w",
          org_capture_refile = "R",
          org_capture_kill = "Q",
        },
        org = {
          org_cycle = "<Leader>cf",
          org_global_cycle = "<Leader>ca",
          org_toggle_checkbox = "<leader>ct",
        },
      },
    })

    vim.cmd([[
    augroup OrgMode
    autocmd!
    autocmd FileType org setlocal foldmethod=manual
    augroup END
]])
  end,
}

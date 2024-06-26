-- return {
--   "nvim-orgmode/orgmode",
--   config = function()
--     require("orgmode").setup_ts_grammar()
--     require("nvim-treesitter.configs").setup({
--       -- If TS highlights are not enabled at all, or disabled via `disable` prop,
--       -- highlighting will fallback to default Vim syntax highlighting
--       highlight = {
--         enable = true,
--         -- Required for spellcheck, some LaTex highlights and
--         -- code block highlights that do not have ts grammar
--         additional_vim_regex_highlighting = { "org" },
--       },
--       ensure_installed = { "org" }, -- Or run :TSUpdate org
--     })
--     require("orgmode").setup({
--       org_agenda_files = { "~/code/org/**/*", "~/OneDrive - Ryanair Ltd/frontend/monthly/*" },
--       org_agenda_templates = {
--         r = {
--           description = "Frontend Report",
--           template = [[
-- ** FE Standup %<%Y-%m-%d>
-- *** Frontend report %<%Y-%m-%d>
-- *** Manager Report
-- *** Highlights
-- *** Report
-- | What | Who | Status |
-- *** AT Coverage
-- ]],
--           target = "~/code/org/report.org",
--         },
--         m = {
--           description = "Monthly Report",
--           template = [[
-- *** %? <%Y-%m>
-- *** Vitals
-- *** Frontend report <%Y-%m-%d>
-- *** Manager Report
-- *** Highlights
-- *** Report
-- | What | Who | Status |
-- ]],
--           target = "~/code/org/report.org",
--         },
--         t = { description = "Task", template = "* TODO %?\n" },
--         j = {
--           description = "Meeting notes",
--           template = [[
-- * %? %<%Y-%m-%d>
-- ** Discussion
-- ** Actions
-- ]],
--           target = "~/code/org/meetings.org",
--         },
--       },
--       org_default_notes_file = "~/code/org/todos.org",
--       org_todo_keywords = {
--         "TODO",
--         "PROGRESS",
--         "|",
--         "DONE",
--         "HOLD",
--         "WAITING",
--         "CANCELLED",
--       },
--       org_agenda_min_height = 60,
--       org_indent_mode = "noindent",
--       mappings = {
--         capture = {
--           org_capture_finalize = "<Leader>w",
--           org_capture_refile = "R",
--           org_capture_kill = "Q",
--         },
--         org = {
--           org_cycle = "<Leader>cf",
--           org_global_cycle = "<Leader>ca",
--           org_toggle_checkbox = "<leader>ct",
--         },
--       },
--     })
--     --
--     --     vim.cmd([[
--     --     augroup OrgMode
--     --     autocmd!
--     --     autocmd FileType org setlocal foldmethod=manual
--     --     augroup END
--     -- ]])
--   end,
-- }

return {
  "nvim-orgmode/orgmode",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", lazy = true },
  },
  event = "VeryLazy",
  enabled = false,
  config = function()
    -- Load treesitter grammar for org
    require("orgmode").setup_ts_grammar()

    -- Setup treesitter
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
      },
      ensure_installed = { "org" },
    })

    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/code/org/**/*",
      org_default_notes_file = "~/code/org/todos.org",
      org_agenda_min_height = 60,
      mappings = {
        org_note_finalize = "<Leader>w",
        org_note_killing = "Q",
      },
      notifications = {
        enabled = false,
        cron_enabled = true,
        repeater_reminder_time = false,
        deadline_warning_reminder_time = false,
        reminder_time = 10,
        deadline_reminder = true,
        scheduled_reminder = true,
        notifier = function(tasks)
          local result = {}
          for _, task in ipairs(tasks) do
            require("orgmode.utils").concat(result, {
              string.format("# %s (%s)", task.category, task.humanized_duration),
              string.format("%s %s %s", string.rep("*", task.level), task.todo, task.title),
              string.format("%s: <%s>", task.type, task.time:to_string()),
            })
          end

          if not vim.tbl_isempty(result) then
            require("orgmode.notifications.notification_popup"):new({ content = result })
          end
        end,
        cron_notifier = function(tasks)
          for _, task in ipairs(tasks) do
            local title = string.format("%s (%s)", task.category, task.humanized_duration)
            local subtitle = string.format("%s %s %s", string.rep("*", task.level), task.todo, task.title)
            local date = string.format("%s: %s", task.type, task.time:to_string())

            -- MacOS
            if vim.fn.executable("terminal-notifier") == 1 then
              vim.loop.spawn(
                "terminal-notifier",
                { args = { "-title", title, "-subtitle", subtitle, "-message", date } }
              )
            end
          end
        end,
      },
    })
  end,
}

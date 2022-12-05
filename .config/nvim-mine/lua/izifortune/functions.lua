local projects = {
	"CHECKIN",
	"FSP",
	"SEATS",
	"BP",
	"EXTRAS",
	"PAX",
	"MHUB",
	"MYRYANAIR",
}

local teams = {
	"WanderDragons",
	"SpaceDogs",
	"Meeseks",
	"BugBusters",
	"Huby",
	"Payment",
  "GOPS",
  "Forms"
}

vim.api.nvim_create_user_command("JSbeautify", function()
	vim.api.nvim_command([[%!js-beautify]])
end, { nargs = 0 })

-- vim.api.nvim_create_user_command("ProjectToggle", function()
--   local toggle = vim.g.project_manual_mode
--   if toggle == nil then
--     toggle = false
--   else
--     toggle = not toggle
--   end
--   vim.g.project_manual_mode = toggle
--   require("project_nvim").setup({
--     manual_mode = toggle
--   })
-- end, { nargs = 0 })

-- vim.api.nvim_create_user_command(
--   'ProjectFiles',
--   "call fzf#vim#files('~/projects', <bang>0)",
--   {bang = true}
-- )
--
--
function coroutinize(f, ...)
	local co = coroutine.create(f)
	local function exec(...)
		local ok, data = coroutine.resume(co, ...)
		if not ok then
			error(debug.traceback(co, data))
		end
		if coroutine.status(co) ~= "dead" then
			data(exec)
		end
	end
	exec(...)
end

vim.api.nvim_create_user_command("AddTeam", function(args)
	local line1 = args["line1"]
	local line2 = args["line2"]
	local date = os.date("!%Y-%m-%d")
	vim.ui.select(teams, { prompt = "Team name: " }, function(team)
		vim.ui.select(projects, { prompt = "Project name: " }, function(project)
			vim.cmd(line1 .. "," .. line2 .. ":Tableize/\t")
			vim.cmd(line1 .. "," .. line2 .. "normal I" .. project)
			vim.cmd(line1 .. "," .. line2 .. "normal I" .. team .. "|")
			vim.cmd(line1 .. "," .. line2 .. "normal I|" .. date .. "|")
			if args["args"] ~= "" then
				vim.cmd(
					line1
						.. [[ normal O|Date|Team|Project|Type|Total Covered|Passed | Failed | Uncovered | Coverage rate | Passed Coverage rate|]]
				)
				vim.cmd(line1 .. [[ normal o|| ]])
			end
		end)
	end)
end, { nargs = "?", range = 2 })

vim.api.nvim_create_user_command("Report line", function(args)
	local statuses = {
		"PROGRESS",
		"DONE",
		"HOLD",
	}
	local line1 = args["line1"]
	local line2 = args["line2"]
	local date = os.date("!%Y-%m-%d")
	vim.ui.input({ prompt = "Report: " }, function(report)
		vim.ui.select(teams, { prompt = "Who: " }, function(teamlead)
			vim.ui.select(statuses, { prompt = "Status: " }, function(status)
				vim.cmd("norm o| " .. report .. " | " .. teamlead .. "| " .. status .. "|")
				vim.cmd("stopinsert")
			end)
		end)
	end)
end, { nargs = "?", range = 2 })

-- vim.api.nvim_create_user_command("AddEnv", function(args)
--   -- local line = args["line1"]
-- end, { nargs = "?", range = 2})

vim.api.nvim_create_user_command("Interview", function(args)
	local date = os.date("!%Y-%m-%d")
	vim.ui.input({ prompt = "Candidate name: " }, function(name)
    name = string.gsub(name, '%s+', '-')
    vim.cmd(string.format("norm O[%s-%s](./%s-%s.md)", date, name, date, name))
    vim.cmd("cd %:p:h")
    vim.cmd("w")
    vim.cmd("e " .. string.format("%s-%s.md", date, name))
    vim.cmd("norm i# " .. name)
				vim.cmd("stopinsert")
    vim.cmd("norm ointervie")
	end)
end, { nargs = 0 })

-- vim.api.nvim_create_user_command("Jira Ticket", function(args)
-- 	local projects = {
-- 		"TP",
-- 		"CAB",
-- 		"EMAIL",
-- 		"RW",
-- 	}
-- 	local date = os.date("!%Y-%m-%d")
-- 	vim.ui.select(projects, { prompt = "Project: " }, function(selectedProject)
-- 		vim.ui.input({ prompt = "Title: " }, function(title)
--       vim.ui.input({ prompt = "Password: ", secret = true }, function(password)
--         vim.fn.
--       end)
-- 		end)
-- 	end)
-- end, { nargs = 0 })

-- vim.api.nvim_create_user_command("EMAILSAU", function()
-- 	vim.cmd([[
-- augroup Emails
-- autocmd!
--   autocmd BufWritePost html :Rooter<cr>
--   autocmd BufWritePost html !yarn build && yarn local && open .local_html/en-IE-processed.html
-- augroup END
-- ]])
-- end, { nargs = 0 })

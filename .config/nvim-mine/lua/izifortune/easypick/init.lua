local easypick = require("easypick")
-- a list of commands that you want to pick from
local list = [[
<< EOF
:Telescope find_files
:Git blame
EOF
]]

easypick.setup({
	pickers = {
		{
			name = "command_palette",
			command = "cat " .. list,
                        -- pass a pre-configured action that runs the command
			action = easypick.actions.run_nvim_command,
                        -- you can specify any theme you want, but the dropdown looks good for this example =)
			opts = require('telescope.themes').get_dropdown({})
		}
	}
})

local M = {}

M.createJiraTicket = function(title)
  local output =
  vim.fn.system('jira issue create -tTask -s"' .. title .. '" -b"' .. title .. '" -a$(jira me) --no-input')
  output.print(output)
  local outputList = {}
  for w in output:gmatch "/" do
    table.insert(outputList, w)
  end
  -- outputList[#outputList] =
end

vim.api.nvim_create_user_command("CreateJiraTicket", function(args) M.createJiraTicket(args.args) end, { nargs = 1 })

vim.api.nvim_create_user_command("NewZettel", function()
  -- command! NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M%S") . ".md"
  vim.cmd [[
  :execute ":e ~/code/knowledge/content/zettelkasten/" . strftime("%Y%m%d%H%M%S") . ".md"
  ]]
end, { nargs = 0 })

-- print(M.asyncGrep('test'))
local edgeRegions = { "eu-central-1", "eu-west-1", "eu-west-2" }

-- Open the logs for a given fucntion in a specific region
vim.api.nvim_create_user_command("EdgeLogs", function(args)
  vim.ui.input({ prompt = "Function name: " }, function(fname)
    vim.ui.select(edgeRegions, { prompt = "region: " }, function(region)
      local initialUrl =
      [[https://us-east-1.console.aws.amazon.com/cloudwatch/home?region=%s\\#logsV2:log-groups/log-group/$252Faws$252Flambda$252Fus-east-1.%s]]
      local url = string.format(initialUrl, region, fname)
      vim.cmd("exec \"!open '" .. url .. "'\"")
    end)
  end)
end, { nargs = "?" })

vim.cmd [[
function! MarkdownClipboardImage() abort
  " Create `img` directory if it doesn't exist
  let img_dir = expand("%:p:h")  . '/static'
  echo img_dir
  if !isdirectory(img_dir)
    silent call mkdir(img_dir)
  endif

  " First find out what filename to use
  let index = 1
  let file_path = img_dir . "/image" . index . ".png"
  let vim_file_path = "./static/image" . index . ".png"
  while filereadable(file_path)
    let index = index + 1
    let file_path = img_dir . "/image" . index . ".png"
    let vim_file_path = "./static/image" . index . ".png"
  endwhile

  let clip_command = 'osascript'
  let clip_command .= ' -e "set png_data to the clipboard as «class PNGf»"'
  let clip_command .= ' -e "set referenceNumber to open for access POSIX path of'
  let clip_command .= ' (POSIX file \"' . file_path . '\") with write permission"'
  let clip_command .= ' -e "write png_data to referenceNumber"'

  silent call system(clip_command)
  if v:shell_error == 1
    normal! p
  else
    execute "normal! i![](" . vim_file_path . ")"

  endif
endfunction
]]

vim.api.nvim_create_user_command(
  "MarkdownClipboardImage",
  function(args) vim.fn.MarkdownClipboardImage() end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  "FormatXML",
  function()
    vim.cmd [[
:%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
]]
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  "FormatJSON",
  function()
    vim.cmd [[
  execute "%!python3 -m json.tool"
  set syntax=json
]]
  end,
  { nargs = 0 }
)

return M

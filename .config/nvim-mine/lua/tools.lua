

-- Execute a file or single line and return the output to a buffer
local function Exec(single)
  local lines
  if single == nil then
    lines = vim.fn.getline(1, '$')
  else
    lines = vim.fn.getline('.')
  end
  command = ''
  if type(lines) == 'table' then
    for key, val in pairs(lines) do
      command = command .. val
    end
  else
    command = lines
  end
  print(command)
  output = vim.fn.systemlist(command)
  vim.api.nvim_command('rightbelow new')
  buf = vim.api.nvim_get_current_buf() 
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
end

return {
  Exec = Exec
}

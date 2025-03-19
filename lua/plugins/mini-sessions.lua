local function check_string(str)
  if str == nil or str == '' then
    vim.notify('SessionName cannot be empty.', vim.log.levels.WARN)
    return false
  end

  if str:match('%W') then
    vim.notify('SessionName can only contain alphanumeric.', vim.log.levels.WARN)
    return false
  end
  return true
end

return {
  'echasnovski/mini.sessions',
  keys = {
    {
      '<Leader>kw',
      function()
        vim.ui.input({ prompt = 'SessionName: ' }, function(input)
          if check_string(input) then
            MiniSessions.write(input)
          end
        end)
      end,
    },
    {
      '<Leader>ks',
      function()
        MiniSessions.select('read')
      end,
    },
    {
      '<Leader>kd',
      function()
        MiniSessions.select('delete')
      end,
    },
  },

  opts = {
    file = '',
    force = { read = false, write = true, delete = true },
  },
}

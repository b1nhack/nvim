local M = {}

local builtin = function()
  return require('telescope.builtin')
end

local function is_git_repo()
  vim.fn.system('git rev-parse --is-inside-work-tree')

  return vim.v.shell_error == 0
end

M.project_files = function()
  local opts = {} -- define here if you want to define something

  if is_git_repo() then
    builtin().git_files(opts)
  else
    builtin().find_files(opts)
  end
end

M.live_grep_from_project_git_root = function()
  local function get_git_root()
    local dot_git_path
    local dir = vim.fn.finddir('.git', '.;')

    if type(dir) == 'string' then
      dot_git_path = dir
    elseif type(dir) == 'table' then
      ---@cast dir string[]
      dot_git_path = dir[1]
    end

    return vim.fn.fnamemodify(dot_git_path, ':h')
  end

  local opts = {}

  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end

  builtin().live_grep(opts)
end

return M

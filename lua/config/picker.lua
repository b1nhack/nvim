local M = {}

local function is_git_repo()
  vim.fn.system('git rev-parse --is-inside-work-tree')

  return vim.v.shell_error == 0
end

function M.project_files()
  if is_git_repo() then
    Snacks.picker.git_files()
  else
    Snacks.picker.files()
  end
end

function M.live_grep_from_project_git_root()
  local function get_git_root()
    local dot_git_path = vim.fn.finddir('.git', '.;')
    return vim.fn.fnamemodify(dot_git_path, ':h')
  end

  local opts = {}

  if is_git_repo() then
    opts = {
      dirs = { get_git_root() },
    }
  end

  Snacks.picker.grep(opts)
end

return M

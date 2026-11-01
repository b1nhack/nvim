local M = {}

local builtin = function()
  return require('telescope.builtin')
end

function M.project_files()
  if vim.fs.root(0, '.git') then
    builtin().git_files()
  else
    builtin().find_files()
  end
end

function M.live_grep_from_project_git_root()
  local opts = {}
  local root = vim.fs.root(0, '.git')
  if root then
    opts.cwd = root
  end
  builtin().live_grep(opts)
end

return M

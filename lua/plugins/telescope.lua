local func = require('config.telescope')
local builtin = function()
  return require('telescope.builtin')
end

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    {
      'benfowler/telescope-luasnip.nvim',
      dependencies = {
        'LuaSnip',
      },
    },
  },
  cmd = 'Telescope',
  -- stylua: ignore
  keys = {
    { '<Leader>ff', func.project_files },
    { '<Leader>fg', func.live_grep_from_project_git_root },
    { '<Leader>fb', function() builtin().buffers() end },
    { '<Leader>fh', function() builtin().help_tags() end },

    { 'gr', function() builtin().lsp_references() end },
    { 'gd', function() builtin().lsp_definitions() end },
    { 'gy', function() builtin().lsp_type_definitions() end },
    { 'gi', function() builtin().lsp_implementations() end },

    { '<Leader>fl', function() builtin().resume() end },
  },

  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local action_layout = require('telescope.actions.layout')

    local open_with_trouble = require('trouble.sources.telescope').open
    -- Use this to add more results without clearing the trouble list
    local add_to_trouble = require('trouble.sources.telescope').add

    local function flash(prompt_bufnr)
      require('flash').jump({
        pattern = '^',
        label = {
          style = 'overlay',
          after = { 0, 0 },
        },
        search = {
          multi_window = true,
          mode = 'search',
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'TelescopeResults'
            end,
          },
        },
        action = function(match)
          local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      })
    end

    telescope.setup({
      defaults = {
        scroll_strategy = 'limit',
        layout_strategy = 'flex',
        prompt_prefix = ' ',
        selection_caret = ' ',
        multi_icon = ' ',
        dynamic_preview_title = true,
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top',
        },

        preview = {
          msg_bg_fillchar = '',
          filesize_limit = 1, -- MB
        },

        -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L133
        default_mappings = {
          i = {
            ['<C-c>'] = actions.close,
            ['<Down>'] = actions.move_selection_next,
            ['<Up>'] = actions.move_selection_previous,
            ['<CR>'] = actions.select_default,
            ['<C-s>'] = actions.select_horizontal,
            ['<C-v>'] = actions.select_vertical,
            ['<C-u>'] = actions.preview_scrolling_up,
            ['<C-e>'] = actions.preview_scrolling_down,
            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
            ['<C-q>'] = add_to_trouble,
            ['<C-l>'] = actions.complete_tag,
            ['<C-/>'] = actions.which_key,
            ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
            ['<C-w>'] = { '<c-s-w>', type = 'command' },
            -- disable c-j because we dont want to allow new lines #2123
            ['<C-j>'] = actions.nop,
            ['<C-p>'] = action_layout.toggle_preview,
            ['<C-t>'] = open_with_trouble,
          },
          n = {
            ['q'] = actions.close,
            ['<CR>'] = actions.select_default,
            ['<C-s>'] = actions.select_horizontal,
            ['<C-v>'] = actions.select_vertical,
            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
            ['<C-q>'] = add_to_trouble,
            ['e'] = actions.move_selection_next,
            ['u'] = actions.move_selection_previous,
            ['U'] = function(prompt_bufnr)
              for _ = 1, 9 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ['E'] = function(prompt_bufnr)
              for _ = 1, 9 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
            ['<Down>'] = actions.move_selection_next,
            ['<Up>'] = actions.move_selection_previous,
            ['gg'] = actions.move_to_top,
            ['G'] = actions.move_to_bottom,
            ['<C-u>'] = actions.preview_scrolling_up,
            ['<C-e>'] = actions.preview_scrolling_down,
            ['?'] = actions.which_key,
            ['<C-p>'] = action_layout.toggle_preview,
            ['s'] = flash,
            ['<C-t>'] = open_with_trouble,
          },
        },
      },

      pickers = {
        find_files = {
          previewer = false,
        },
        buffers = {
          mappings = {
            i = {
              ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
            },
            n = {
              ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },

        git_bcommits = {
          mappings = {
            i = {
              ['<C-]>'] = actions.cycle_previewers_next,
              ['<C-[>'] = actions.cycle_previewers_prev,
            },
            n = {
              ['<C-]>'] = actions.cycle_previewers_next,
              ['<C-[>'] = actions.cycle_previewers_prev,
            },
          },
        },

        git_commits = {
          mappings = {
            i = {
              ['<C-]>'] = actions.cycle_previewers_next,
              ['<C-[>'] = actions.cycle_previewers_prev,
            },
            n = {
              ['<C-]>'] = actions.cycle_previewers_next,
              ['<C-[>'] = actions.cycle_previewers_prev,
            },
          },
        },

        git_files = {
          previewer = false,
        },

        lsp_references = { initial_mode = 'normal', reuse_win = true, theme = 'ivy' },
        lsp_definitions = { initial_mode = 'normal', reuse_win = true, theme = 'ivy' },
        lsp_type_definitions = { initial_mode = 'normal', reuse_win = true, theme = 'ivy' },
        lsp_implementations = { initial_mode = 'normal', reuse_win = true, theme = 'ivy' },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    })

    telescope.load_extension('harpoon')
    telescope.load_extension('luasnip')
    telescope.load_extension('noice')
    telescope.load_extension('notify')
  end,
}

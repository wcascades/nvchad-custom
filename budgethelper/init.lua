local M  = {}
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

function M.categories(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "budget categories",
    finder = finders.new_table {
      results = {
        "amazon",
        "career",
        "childcare",
        "clothes",
        "entertainment",
        "groceries",
        "house",
        "home maintenane",
        "medical",
        "personal",
        "recreation",
        "take out",
        "transportation",
        "utilities",
        "uncategorized",
        "vehicle maintenane"
      }
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        selection = selection[1]
        vim.cmd("normal! ciw" .. selection)
      end)
      return true
    end,
  }):find()
end

return M

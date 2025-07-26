return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- Custom unified search that combines both files and content
    {
      "<leader>sf",
      function()
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        
        pickers.new({}, {
          prompt_title = "Unified Search (Files + Content)",
          finder = finders.new_async_job({
            command_generator = function(prompt)
              if not prompt or prompt == "" then
                return nil
              end
              
              local cmd = string.format([[
                (
                  git ls-files 2>/dev/null | grep -i '%s' | head -15 | sed 's/^/FILE:/' ;
                  rg --line-number --column --no-heading --color=never --smart-case --max-count=2 --hidden --glob '!{.git,node_modules,dist,build}/**' '%s' 2>/dev/null | head -10 | sed 's/^/CONTENT:/'
                ) 2>/dev/null
              ]], vim.fn.shellescape(prompt), vim.fn.shellescape(prompt))
              
              return { "sh", "-c", cmd }
            end,
            entry_maker = function(entry)
              if not entry or entry == "" then
                return nil
              end
              
              if entry:match("^FILE:") then
                local filename = entry:gsub("^FILE:", ""):gsub("^%s*", ""):gsub("%s*$", "")
                return {
                  value = filename,
                  display = "📁 " .. filename,
                  ordinal = filename,
                  filename = filename,
                  lnum = 1,
                  col = 1,
                }
              elseif entry:match("^CONTENT:") then
                local content = entry:gsub("^CONTENT:", "")
                local filename, lnum, col, text = content:match("^([^:]+):(%d+):(%d+):(.*)")
                if filename and lnum and col then
                  return {
                    value = content,
                    display = "📄 " .. filename .. ":" .. lnum .. " " .. (text and text:gsub("^%s+", ""):sub(1, 70) or ""),
                    ordinal = filename .. " " .. (text or ""),
                    filename = filename,
                    lnum = tonumber(lnum),
                    col = tonumber(col),
                  }
                end
              end
              return nil
            end,
          }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              if selection and selection.filename then
                vim.cmd.edit(selection.filename)
                if selection.lnum and selection.lnum > 1 then
                  vim.api.nvim_win_set_cursor(0, {selection.lnum, math.max(0, (selection.col or 1) - 1)})
                end
              end
            end)
            return true
          end,
        }):find()
      end,
      desc = "Unified Search (Files + Content)",
    },
  },
}
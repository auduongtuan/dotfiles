return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("diffview").setup({
      diff_binaries = false, -- Show diffs for binaries
      enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
      git_cmd = { "git" }, -- The git executable followed by default args
      use_icons = true, -- Requires nvim-web-devicons
      show_help_hints = true, -- Show hints for how to open the help panel
      watch_index = true, -- Update views and index on git index changes
      icons = { -- Only applies when use_icons is true
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        -- Configure the layout and behavior of different types of views
        default = {
          -- Config for changed files, and staged files in diff views
          layout = "diff2_horizontal",
        },
        merge_tool = {
          -- Config for conflicted files in diff views during a merge or rebase
          layout = "diff3_horizontal",
          disable_diagnostics = true,
        },
        file_history = {
          -- Config for changed files in file history views
          layout = "diff2_horizontal",
        },
      },
      file_panel = {
        listing_style = "tree", -- One of 'list' or 'tree'
        tree_options = { -- Only applies when listing_style is 'tree'
          flatten_dirs = true, -- Flatten dirs that only contain one single dir
          folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'
        },
        win_config = { -- See ':h diffview-config-win_config'
          position = "left",
          width = 35,
        },
      },
      file_history_panel = {
        log_options = { -- See ':h diffview-config-log_options'
          git = {
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
        },
        win_config = { -- See ':h diffview-config-win_config'
          position = "bottom",
          height = 16,
        },
      },
      commit_log_panel = {
        win_config = { -- See ':h diffview-config-win_config'
          position = "bottom",
          height = 16,
        },
      },
      default_args = { -- Default args prepended to the arg-list for the listed commands
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {}, -- See ':h diffview-config-hooks'
      keymaps = {
        disable_defaults = false, -- Disable the default keymaps
        view = {
          -- The `view` bindings are active in the diff buffers, only when the current
          -- tabpage is a Diffview
          { "n", "<tab>", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "g<C-x>", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "<leader>e", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "<leader>co", "<cmd>DiffviewConflictChooseOurs<CR>", { desc = "Choose the OURS version" } },
          { "n", "<leader>ct", "<cmd>DiffviewConflictChooseTheirs<CR>", { desc = "Choose the THEIRS version" } },
          { "n", "<leader>cb", "<cmd>DiffviewConflictChooseBase<CR>", { desc = "Choose the BASE version" } },
          { "n", "<leader>ca", "<cmd>DiffviewConflictChooseAll<CR>", { desc = "Choose all the versions" } },
          { "n", "dx", "<cmd>DiffviewConflictNextConflict<CR>", { desc = "Next conflict" } },
          { "n", "dX", "<cmd>DiffviewConflictPrevConflict<CR>", { desc = "Previous conflict" } },
        },
        diff1 = {
          -- Mappings in single pane diff layouts
          { "n", "g?", "<cmd>DiffviewToggleFiles<CR>", { desc = "Open the help panel" } },
        },
        diff2 = {
          -- Mappings in 2-way diff layouts
          { "n", "g?", "<cmd>DiffviewToggleFiles<CR>", { desc = "Open the help panel" } },
        },
        diff3 = {
          -- Mappings in 3-way diff layouts
          { "n", "g?", "<cmd>DiffviewToggleFiles<CR>", { desc = "Open the help panel" } },
        },
        diff4 = {
          -- Mappings in 4-way diff layouts
          { "n", "g?", "<cmd>DiffviewToggleFiles<CR>", { desc = "Open the help panel" } },
        },
        file_panel = {
          { "n", "j", "j", { desc = "Next entry" } },
          { "n", "<down>", "j", { desc = "Next entry" } },
          { "n", "k", "k", { desc = "Previous entry" } },
          { "n", "<up>", "k", { desc = "Previous entry" } },
          { "n", "<cr>", "<cmd>DiffviewOpen<CR>", { desc = "Open the diff for the selected entry" } },
          { "n", "o", "<cmd>DiffviewOpen<CR>", { desc = "Open the diff for the selected entry" } },
          { "n", "<2-LeftMouse>", "<cmd>DiffviewOpen<CR>", { desc = "Open the diff for the selected entry" } },
          { "n", "-", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "s", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "<tab>", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "gf", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "i", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "f", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "F", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "g<C-x>", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
          { "n", "R", "<cmd>DiffviewRefresh<CR>", { desc = "Refresh the entries and redraw the view" } },
          { "n", "<leader>e", "<cmd>DiffviewToggleFiles<CR>", { desc = "Focus the file panel" } },
          { "n", "<leader>b", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle between this and the previous tabpage" } },
          { "n", "gf", "<cmd>DiffviewGoToFile<CR>", { desc = "Open the file in the previous tabpage" } },
          { "n", "<C-w><C-f>", "<cmd>DiffviewGoToFile<CR>", { desc = "Open the file in a new split" } },
          { "n", "<C-w>gf", "<cmd>DiffviewGoToFile<CR>", { desc = "Open the file in a new tabpage" } },
          { "n", "<leader>cO", "<cmd>DiffviewConflictChooseOurs<CR>", { desc = "Choose the OURS version for the whole file" } },
          { "n", "<leader>cT", "<cmd>DiffviewConflictChooseTheirs<CR>", { desc = "Choose the THEIRS version for the whole file" } },
          { "n", "<leader>cB", "<cmd>DiffviewConflictChooseBase<CR>", { desc = "Choose the BASE version for the whole file" } },
          { "n", "<leader>cA", "<cmd>DiffviewConflictChooseAll<CR>", { desc = "Choose all the versions for the whole file" } },
          { "n", "dx", "<cmd>DiffviewConflictNextConflict<CR>", { desc = "Next conflict" } },
          { "n", "dX", "<cmd>DiffviewConflictPrevConflict<CR>", { desc = "Previous conflict" } },
        },
        file_history_panel = {
          { "n", "g!", "<cmd>DiffviewToggleFiles<CR>", { desc = "Open the option panel" } },
          { "n", "<C-A-d>", "<cmd>DiffviewToggleFiles<CR>", { desc = "Open the option panel" } },
          { "n", "y", "<cmd>DiffviewYankCommit<CR>", { desc = "Yank the commit hash of the entry under the cursor" } },
          { "n", "L", "<cmd>DiffviewToggleFiles<CR>", { desc = "Show commit details" } },
          { "n", "zR", "<cmd>DiffviewToggleFiles<CR>", { desc = "Expand all folds" } },
          { "n", "zM", "<cmd>DiffviewToggleFiles<CR>", { desc = "Collapse all folds" } },
          { "n", "j", "j", { desc = "Next entry" } },
          { "n", "<down>", "j", { desc = "Next entry" } },
          { "n", "k", "k", { desc = "Previous entry" } },
          { "n", "<up>", "k", { desc = "Previous entry" } },
          { "n", "<cr>", "<cmd>DiffviewOpen<CR>", { desc = "Open the diff for the selected entry" } },
          { "n", "o", "<cmd>DiffviewOpen<CR>", { desc = "Open the diff for the selected entry" } },
          { "n", "<2-LeftMouse>", "<cmd>DiffviewOpen<CR>", { desc = "Open the diff for the selected entry" } },
        },
        option_panel = {
          { "n", "<tab>", "<cmd>DiffviewToggleFiles<CR>", { desc = "Focus the file panel" } },
          { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
          { "n", "<esc>", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
        },
        help_panel = {
          { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close help menu" } },
          { "n", "<esc>", "<cmd>DiffviewClose<CR>", { desc = "Close help menu" } },
        },
      },
    })
  end,
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open DiffView" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close DiffView" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
    { "<leader>ghf", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
  },
}
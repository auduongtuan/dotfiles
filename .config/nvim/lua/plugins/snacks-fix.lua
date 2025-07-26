return {
  "folke/snacks.nvim",
  lazy = false,
  init = function()
    -- Define rainbow highlight groups for TUAN header
    vim.api.nvim_set_hl(0, 'TuanRed', { fg = '#FF6B6B', bold = true })
    vim.api.nvim_set_hl(0, 'TuanOrange', { fg = '#FFB366', bold = true })
    vim.api.nvim_set_hl(0, 'TuanYellow', { fg = '#FFEB66', bold = true })
    vim.api.nvim_set_hl(0, 'TuanGreen', { fg = '#66FF6B', bold = true })
    vim.api.nvim_set_hl(0, 'TuanBlue', { fg = '#66B3FF', bold = true })
    vim.api.nvim_set_hl(0, 'TuanPurple', { fg = '#B366FF', bold = true })
  end,
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { text = { { "████████╗██╗   ██╗ █████╗ ███╗   ██╗", hl = "TuanRed" } }, align = "center" },
        { text = { { "╚══██╔══╝██║   ██║██╔══██╗████╗  ██║", hl = "TuanOrange" } }, align = "center" },
        { text = { { "   ██║   ██║   ██║███████║██╔██╗ ██║", hl = "TuanYellow" } }, align = "center" },
        { text = { { "   ██║   ██║   ██║██╔══██║██║╚██╗██║", hl = "TuanGreen" } }, align = "center" },
        { text = { { "   ██║   ╚██████╔╝██║  ██║██║ ╚████║", hl = "TuanBlue" } }, align = "center" },
        { text = { { "   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝", hl = "TuanPurple" } }, align = "center" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
      formats = {
        recent_files = function(file)
          return {
            file = file,
            icon = "📄",
            title = vim.fn.fnamemodify(file, ":t"),
            compact_path = true,
          }
        end,
      },
    },
  },
}
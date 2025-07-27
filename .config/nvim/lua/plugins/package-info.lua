return {
  "vuki656/package-info.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    colors = {
      up_to_date = "#3c4048",
      outdated = "#d19a66",
      invalid = "#ee4b2b",
    },
    icons = {
      enable = true,
      style = {
        up_to_date = "|  ",
        outdated = "|  ",
        invalid = "|  ",
      },
    },
    autostart = true,
    hide_up_to_date = false,
    hide_unstable_versions = false,
    package_manager = "auto",
  },
  event = {
    "BufRead package.json",
    "BufRead */package.json",
  },
  keys = {
    { "<leader>ns", "<cmd>lua require('package-info').show()<cr>", desc = "Show dependency versions" },
    { "<leader>nc", "<cmd>lua require('package-info').hide()<cr>", desc = "Hide dependency versions" },
    { "<leader>nt", "<cmd>lua require('package-info').toggle()<cr>", desc = "Toggle dependency versions" },
    { "<leader>nu", "<cmd>lua require('package-info').update()<cr>", desc = "Update dependency on the line" },
    { "<leader>nd", "<cmd>lua require('package-info').delete()<cr>", desc = "Delete dependency on the line" },
    { "<leader>ni", "<cmd>lua require('package-info').install()<cr>", desc = "Install a new dependency" },
    { "<leader>np", "<cmd>lua require('package-info').change_version()<cr>", desc = "Change dependency version" },
    { "<leader>nP", function()
        local function show_package_panel()
          vim.cmd("split | terminal npm outdated --depth=0")
          vim.cmd("resize 15")
        end
        show_package_panel()
      end, desc = "Show package panel (outdated deps)" },
  },
}
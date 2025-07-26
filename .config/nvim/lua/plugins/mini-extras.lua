return {
  -- mini.bracketed for bracket navigation
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    config = function()
      require("mini.bracketed").setup()
    end,
  },
  
  -- mini.pick as picker
  {
    "echasnovski/mini.pick",
    event = "VeryLazy",
    config = function()
      require("mini.pick").setup()
    end,
  },
  
  -- mini.icons for icons
  {
    "echasnovski/mini.icons",
    lazy = true,
    config = function()
      require("mini.icons").setup()
    end,
  },
}
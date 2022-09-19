return function()
  local wk = require("which-key")
  wk.setup({
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<esc>"] = "ESC",
      ["<bs>"] = "BACK",
      ["<tab>"] = "TAB",
    },
  })
  wk.register({
    ["<space>"] = {
      function()
        print("hello world")
      end,
      "Foobar",
    },
  }, { prefix = "<leader>" })
end

-- Typescript configuration
return function()
  print("Hello!!!")
  require("lspconfig").tsserver.setup({})
end

local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(params)
end

local servers = {"tsserver", "tailwindcss", "eslint"}

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == "tsserver" then
    opts.init_options = {
      preferences = {
        disableSuggestions = true,
      }
    }
    opts.commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      }
    }
  end

  lspconfig[lsp].setup(opts)
end


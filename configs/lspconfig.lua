local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

-- Define the function to organize imports for TypeScript
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(params)
end

-- List of LSP servers to configure
local servers = {"tsserver", "tailwindcss", "eslint"}

-- Loop through each server and set up its configuration
for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- Add specific configurations for tsserver
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

  -- Set up the server with the specified options
  lspconfig[lsp].setup(opts)
end

-- Specific configuration for clangd
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

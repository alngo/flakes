local on_attach = function(client, bufnr)
  vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })

  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
end

-- Enable Rust LSP
vim.lsp.config('rust_analyzer', {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
})

vim.lsp.enable('rust_analyzer')

-- Enable Lua LSP
vim.lsp.config('lua_ls', {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- Neovim uses LuaJIT
      },
      diagnostics = {
        globals = { 'vim' }, -- recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- make server aware of Neovim runtime files
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable('lua_ls')

-- Configure diagnostics globally
vim.diagnostic.config({
  virtual_text = true,   -- Show diagnostics inline as virtual text
  signs = true,          -- Show signs in the sign column
  underline = true,      -- Underline problematic code
  update_in_insert = false, -- Don't update diagnostics while typing
  severity_sort = true,  -- Sort diagnostics by severity
})

-- Custom diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Works best with completeopt=noselect.
-- Use CTRL-Y to select an item. |complete_CTRL-Y|
vim.cmd[[set completeopt+=menuone,noselect,popup]]

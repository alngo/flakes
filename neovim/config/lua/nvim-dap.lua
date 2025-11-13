local dap = require('dap')

-- Enable Rust DAP
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust path
  name = 'lldb'
}

dap.configurations.rust = {
  {
    name = "Debug executable",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

-- DAP Mapping
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

-- Enable Copilot globally
vim.g.copilot_enabled = 1

-- Optional: disable Copilot for certain filetypes
vim.g.copilot_filetypes = {
  ["markdown"] = false,
  ["text"] = false,
}

-- Keymaps for Copilot
vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
vim.keymap.set("i", "<C-n>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<C-p>", "<Plug>(copilot-previous)")
vim.keymap.set("i", "<C-c>", "<Plug>(copilot-dismiss)")

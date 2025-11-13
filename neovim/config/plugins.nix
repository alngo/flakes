{ pkgs }:
with pkgs.vimPlugins; [
  telescope-nvim
  nvim-dap
  nvim-lspconfig
  copilot-vim
]

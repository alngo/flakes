{ pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
  }
}:

let
  customRC = import ./config { inherit pkgs; };
  plugins = import ./config/plugins.nix { inherit pkgs; };
in pkgs.wrapNeovim pkgs.neovim-unwrapped {
      configure = {
        inherit customRC;
        packages.all.start = plugins;
      };
    }

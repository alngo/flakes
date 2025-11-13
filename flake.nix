{
  description = "Flakes";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.neovim = import ./neovim { inherit pkgs; };

      apps.${system}.neovim = {
        type = "app";
        program = "${self.packages.${system}.neovim}/bin/nvim";
      };
    };
}


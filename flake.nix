{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: rec {
      pkgs = import nixpkgs { inherit system; };

      # https://nixos.wiki/wiki/Development_environment_with_nix-shell
      defaultPackage = pkgs.mkShell {
        nativeBuildInputs = [ pkgs.dosbox ];
      };
    });
}

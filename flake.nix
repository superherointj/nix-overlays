{
  description = "ocaml-packages-overlay";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, gitignore, flake-utils }:
    let
      overlay = final: prev: (import ./default.nix) final prev;
      remove_fns = packages : builtins.removeAttrs packages [
        "override"
        "overrideDerivation"
      ];
    in
    ({
      inherit overlay;
      hydraJobs = {
        x86_64-linux = (import ./hydra.nix { pkgs = self.pkgs.x86_64-linux; system = "x86_64-linux"; });
        aarch64-darwin = (import ./hydra.nix { pkgs = self.pkgs.aarch64-darwin; system = "aarch64-darwin"; });
      };
    } // flake-utils.lib.eachDefaultSystem (system: rec {
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ gitignore.overlay overlay ];
      };
      legacyPackages = self.pkgs."${system}";
      
    }));
}

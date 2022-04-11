{
  description = "ocaml-packages-overlay";

  inputs = {
    nixpkgs.url ="github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, gitignore, flake-utils }: 
  let overlay = final: prev: (import ./default.nix) final prev; in
  ({
    inherit overlay;  
  } // flake-utils.lib.eachDefaultSystem (system: rec {
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ gitignore.overlay overlay ];
    };
    packages = import ./boot.nix {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    legacyPackages = pkgs."${system}";
    makePkgs = attrs: import ./boot.nix attrs;
    hydraJobs = import ./hydra.nix { inherit pkgs; };
  }));
}

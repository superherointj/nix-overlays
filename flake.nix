{
  description = "ocaml-packages-overlay";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: 
  let overlay = final: prev: (import ./default.nix) final prev; in
  ({
    inherit overlay;  
  } // flake-utils.lib.eachDefaultSystem (system: rec {
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ overlay ];
    };
    packages = import ./boot.nix {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    legacyPackages = self.packages."${system}";
    makePkgs = attrs: import ./boot.nix attrs;

    hydraJobs = import ./hydra.nix { inherit pkgs; };
  }));
}

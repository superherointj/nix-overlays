{ pkgs }:

{
  build_4_12 = import ./ci.nix { inherit pkgs; ocamlVersion = "4_12"; target = "native"; };
}
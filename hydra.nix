{ pkgs }:

{
  build_4_12 = builtins.zipAttrsWith (name: values: { inherit name values; }) (import ./ci.nix { inherit pkgs; ocamlVersion = "4_12"; target = "native"; });
}
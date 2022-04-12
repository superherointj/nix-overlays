{ pkgs }:

{
  build_4_12 = with pkgs.ocaml-ng.ocamlPackages_4_12; {
    inherit piaf carl caqti-driver-postgresql ppx_deriving dream melange lwt jose archi;
  };
}

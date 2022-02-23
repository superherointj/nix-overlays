{
  unstable = builtins.fetchTarball {
    name = "nixos-unstable-2022-02-20";
    url = https://github.com/nixos/nixpkgs/archive/cf654f7.tar.gz;
    sha256 = "0al7qmys87irv4gv9lsd6hgl2q8q442vjc8x5ngh3zi3c86cvjhx";
  };

  staging = builtins.fetchTarball {
    name = "nixos-unstable-staging";
    url = https://github.com/nixos/nixpkgs/archive/445a2455ad.tar.gz;
    sha256 = "1ia3qnjab4vv9fpwfgkcky7fvdiqzqar00mdbvnm8va80wx127x4";
  };

  local = ../nixpkgs;
}.unstable

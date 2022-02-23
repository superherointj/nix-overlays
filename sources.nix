{
  unstable = builtins.fetchTarball {
    name = "nixos-unstable-2022-02-20";
    url = https://github.com/nixos/nixpkgs/archive/19b762db.tar.gz;
    sha256 = "06m1qaylk0mzkdzkcmb9r3c0997sw2plf02dqdg8sph0iwlmncz3";
  };

  staging = builtins.fetchTarball {
    name = "nixos-unstable-staging";
    url = https://github.com/nixos/nixpkgs/archive/445a2455ad.tar.gz;
    sha256 = "1ia3qnjab4vv9fpwfgkcky7fvdiqzqar00mdbvnm8va80wx127x4";
  };

  local = ../nixpkgs;
}.unstable

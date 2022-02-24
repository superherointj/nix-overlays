{
  unstable = builtins.fetchTarball {
    name = "nixos-unstable-2022-02-20";
    url = https://github.com/nixos/nixpkgs/archive/d099bec942c.tar.gz;
    sha256 = "07yqlw1qwqllpjjrn5myp6zjm8d2dm8bnq3agcp3ipw0dg7v32h1";
  };

  staging = builtins.fetchTarball {
    name = "nixos-unstable-staging";
    url = https://github.com/nixos/nixpkgs/archive/445a2455ad.tar.gz;
    sha256 = "1ia3qnjab4vv9fpwfgkcky7fvdiqzqar00mdbvnm8va80wx127x4";
  };

  local = ../nixpkgs;
}.unstable

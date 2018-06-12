{ stdenv, fetchgit, buildGoPackage }:

buildGoPackage rec {
  version = "1.0.1";
  baseName = "aws-console-url";
  name = "${baseName}-${version}";

  goPackagePath = "git.realestate.com.au/david-yeung/aws-console-url";
  goDeps = ./deps.nix;

  # Assumes we have run `nix-prefetch-git` as the source is private:
  #
  #     nix-prefetch-git git@git.realestate.com.au:david-yeung/aws-console-url.git 620d18e5989afa9ed3cd4390bd7e441872f49bd6 1vh7c9wfhdc7amvan0wzywdsvqbj8csrpsbiz4r50n7xhv6alh5v
  #
  src = fetchgit {
    url = "git@git.realestate.com.au:david-yeung/aws-console-url.git";
    rev = "v1.0.1";
    sha256 = "1ck7385kckc7cz97ifnwpfngsvj4a78acygydnx57m7mzsvyhz07";
  };
}

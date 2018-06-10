let
  unstable = import <nixpkgs-unstable> {};
in {
  allowUnfree = true;
  allowBroken = true;

  packageOverrides = pkgs_: with pkgs_; {

    scalaDevEnv = ./scalaDevEnv.nix;
    reaDevEnv = ./rea/reaDevEnv.nix;

    nixDevEnv = with pkgs; buildEnv {
      name = "nix-dev-env";

      paths = [
        # Haskell
        unstable.ghc
        unstable.stack
        unstable.haskellPackages.hlint
        unstable.haskellPackages.stylish-haskell
        haskellPackages.hasktags # unstable doesn't compile
        unstable.haskellPackages.hoogle
        unstable.haskellPackages.intero
        unstable.haskellPackages.apply-refact
        unstable.cabal2nix
        unstable.cabal-install

        # Docker
        docker
        unstable.docker_compose

        # Misc
        unstable.git
        vim

        # Unsolved
        # bash it
      ];
    };
  };
}

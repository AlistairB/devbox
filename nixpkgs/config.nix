let
  unstable = import <nixpkgs-unstable> {};
in {
  allowUnfree = true;
  allowBroken = true;

  packageOverrides = pkgs_: with pkgs_; {
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
        unstable.cabal2nix
        unstable.cabal-install

        # Docker
        docker
        # hmm fails with undefined variable 'docker-compose'
        # docker-compose

        # Misc
        git

        # Unsolved
        # bash it
      ];
    };
  };
}

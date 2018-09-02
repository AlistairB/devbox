let
  unstable = import <nixpkgs-unstable> {};
in {
  allowUnfree = true;
  allowBroken = true;

  packageOverrides = pkgs_: with pkgs_; {

    rea-as = callPackage ./rea/rea-as {};
    aws-console-url = callPackage ./rea/aws-console-url {};
    rea-slip-utils = callPackage ./rea/rea-slip-utils {};

    reaDevEnv = with pkgs; buildEnv {
      name = "rea-dev-env";

      paths = [
        # For rea deps
        nix-prefetch-git

        # Go
        go
        go2nix

        # AWS
        awscli

        postgresql100
      ];
    };

    scalaDevEnv = with pkgs; buildEnv {
      name = "scala-dev-env";

      paths = [
        jdk

        ruby

        scala
        unstable.sbt
        ammonite-repl
      ];
    };

    nixDevEnv = with pkgs; buildEnv {
      name = "nix-dev-env";

      paths = [
        # Haskell
        unstable.ghc
        # unstable.stack - requires zlib but installing via nix doesn't seem to fix?
        unstable.haskellPackages.hlint
        unstable.haskellPackages.stylish-haskell
        unstable.haskellPackages.hasktags
        unstable.haskellPackages.hoogle
        unstable.haskellPackages.intero
        unstable.haskellPackages.apply-refact
        unstable.haskellPackages.hpack
        unstable.haskellPackages.ghcid
        unstable.haskellPackages.weeder
        # unstable.haskellPackages.hpack-convert - not building https://github.com/yamadapc/hpack-convert/issues/18
        unstable.cabal2nix
        unstable.cabal-install

        # Docker
        unstable.docker_compose

        # Misc
        unstable.git
        vim

        scalaDevEnv
        reaDevEnv
      ];
    };
  };
}

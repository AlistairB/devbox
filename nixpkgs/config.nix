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

        # Go for rea deps
        go
        go2nix

        # can be installed with pip :/
        awscli
      ];
    };

    jvmDevEnv = with pkgs; buildEnv {
      name = "jvm-dev-env";

      paths = [
        # Can be install with .deb but no PPA
        unstable.scala

        # Manual install
        unstable.ammonite-repl
      ];
    };

    nixDevEnv = with pkgs; buildEnv {
      name = "nix-dev-env";

      paths = [
        # Could be installed with stack, but how to update?
        unstable.haskellPackages.hlint
        unstable.haskellPackages.stylish-haskell
        unstable.haskellPackages.hoogle
        unstable.haskellPackages.hpack
        unstable.haskellPackages.ghcid
        unstable.haskellPackages.weeder
        # haskellPackages.smuggler # stable and unstable don't build
        # unstable.haskellPackages.hpack-convert - not building https://github.com/yamadapc/hpack-convert/issues/18

        # Manual install
        unstable.docker_compose

        jvmDevEnv
        reaDevEnv
      ];
    };
  };
}

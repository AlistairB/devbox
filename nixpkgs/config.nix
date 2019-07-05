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
        unstable.docker_compose

        jvmDevEnv
        reaDevEnv
      ];
    };
  };
}

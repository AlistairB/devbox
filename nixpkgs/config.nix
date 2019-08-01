let
  unstable = import <nixpkgs-unstable> {};
in {
  allowUnfree = true;
  allowBroken = true;

  packageOverrides = pkgs_: with pkgs_; {

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
      ];
    };
  };
}

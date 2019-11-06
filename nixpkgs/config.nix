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
        # blarg. There is an issue on github to track including this in the docker for linux release
        # but can't find it. The other option is pip, but I couldn't see how to keep it up to date
        # nicely. May try again.
        unstable.docker_compose

        jvmDevEnv
      ];
    };
  };
}

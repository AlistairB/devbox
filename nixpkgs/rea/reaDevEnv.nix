let
  unstable = import <nixpkgs-unstable> {};
in {
  allowUnfree = true;
  allowBroken = true;
  rea-as = callPackage ./rea-as {};

  reaDevEnv = with pkgs; buildEnv {
    name = "rea-dev-env";
    # aws-console-url = callPackage ./rea/aws-console-url {};
    # rea-slip-utils = callPackage ./rea/rea-slip-utils {};

    paths = [
      # For rea deps
      nix-prefetch-git

      # Go
      go
      go2nix

    ];
  };
}

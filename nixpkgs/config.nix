let
  unstable = import <nixpkgs-unstable> {};
in {
  allowUnfree = true;
  allowBroken = true;

  packageOverrides = pkgs_: with pkgs_; {

    nixDevEnv = with pkgs; buildEnv {
      name = "nix-dev-env";

      paths = [
        # https://github.com/docker/compose/issues/2235 for adding docker_compose into the docker release somehow.
        # The other option is some regular pull eg. `curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose`
        unstable.docker_compose
      ];
    };
  };
}

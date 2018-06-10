let
  unstable = import <nixpkgs-unstable> {};
in {
  allowUnfree = true;
  allowBroken = true;
  scalaDevEnv = with pkgs; buildEnv {
    name = "scala-dev-env";

    paths = [
      jdk

      # Scala
      scala
      sbt
      ammonite-repl
    ];
  };
}

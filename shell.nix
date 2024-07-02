{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python39
    pkgs.poetry
    pkgs.git

  ];



  shellHook =
    ''
      echo "entering deep learning enviornment"
      export GH_TOKEN="$(cat ~/Projects/ghtoken.txt)"

    '';
}

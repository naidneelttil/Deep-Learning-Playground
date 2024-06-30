{ pkgs ? import <nixpkgs> {} }:

inputs  = {poetry2nix.url = "github:nix-community/poetry2nix";}
outputs = {self, poetry2nix} @ inputs:
let
  inherit (poetry2nix.lib.mkPoetry2Nix { inherit pkgs; }) mkPoetryApplication;
      myPythonApp = mkPoetryApplication { projectDir = ./.; };
  myAppEnv = pkgs.poetry2nix.mkPoetryEnv {
    projectDir = ./.;
    editablePackageSources = {
      my-app = ./src;
    };
  };
in myAppEnv.env

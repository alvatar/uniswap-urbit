{ pkgs ? import <nixpkgs> {} }:

let
  lib = import <nixpkgs/lib>;
  buildNodeJs = pkgs.callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {};

  nodejsVersion = "14.19.0";

  nodejs = buildNodeJs {
    enableNpm = false;
    version = nodejsVersion;
    sha256 = "e92e846300e6117547d37ea8d5bd32244c19b2fcefcb39e1420a47637f45030c";
  };

  NPM_CONFIG_PREFIX = toString ./npm_config_prefix;

in pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    nodePackages.npm
  ];

  inherit NPM_CONFIG_PREFIX;

  shellHook = ''
    export PATH="${NPM_CONFIG_PREFIX}/bin:$PATH"
  '';
}

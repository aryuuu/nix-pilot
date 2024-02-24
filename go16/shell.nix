## shell.nix
#
## This is a simple shell.nix file for Go 1.16

let
    pkgs = import <nixpkgs> {};
    go_16_pkgs = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/5c1ffb7a9fc96f2d64ed3523c2bdd379bdb7b471.tar.gz";
    }) {};

    go_16 = go_16_pkgs.go;
    fish_shell = pkgs.fish;
in

pkgs.mkShell {
    buildInputs = [
        go_16
        fish_shell
    ];

    shellHook = ''
        export SHELL=$(which fish)
        fish -N
    '';
}


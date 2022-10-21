#! /usr/bin/env bash

rm -R uniswap-glob
cp shell.nix uniswap-interface/
cd uniswap-interface/
nix-shell shell.nix --command 'yarn'
nix-shell shell.nix --command 'yarn build'
cd ..
mv uniswap-interface/build uniswap-glob
cd uniswap-glob
find . -iname "*.map" | xargs rm

#! /usr/bin/env bash

cp shell.nix uniswap-interface/
cd uniswap-interface/
nix-shell shell.nix --command 'yarn build'
cd ..
mv uniswap-interface/build uniswap-glob
cd uniswap-glob

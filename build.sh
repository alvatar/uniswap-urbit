#! /usr/bin/env bash

cd uniswap-interface/
yarn build
cd ..
mv uniswap-interface/build uniswap-glob
cd uniswap-glob
find . -name "*.map" | xargs rm

#!/bin/bash

if [ ! -d "vcpkg" ]; then
    git clone --depth 1 https://github.com/microsoft/vcpkg
    echo '[1] boostrap -- start'
    ./vcpkg/bootstrap-vcpkg.sh
    echo '[1] boostrap -- end'
fi

echo '[1] install -- start'
./vcpkg/vcpkg install --overlay-triplets=custom-triplets --triplet=x64-osx-10.9 zlib libogg opus opusfile libvorbis
echo '[1] install -- end'

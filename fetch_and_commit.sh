#!/bin/sh

echo "Fetching depedancies..."

sudo apt install 7zip

echo "Making dir $PWD/out"

mkdir out

echo "cd'ng to $PWD/out"

cd out

if [ "$PWD" = "/" ]; then
  echo "Cant run when out dir is /"
  exit 2
fi

sudo rm -rf ./*

echo "Downloading the livecd iso"

curl https://iso.reactos.org/livecd/latest-x86-gcc-lin-rel > reactos_livecd_latest.7z

echo "Decompressing the livecd"

7za x *.7z
rm -r *.7z
mv *livecd*.iso reactos_livecd_latest.iso

echo "Downloading the bootcd iso"

curl https://iso.reactos.org/bootcd/latest-x86-gcc-lin-rel > reactos_bootcd_latest.7z

echo "Decompressing the bootcd"

7za x *.7z
rm -r *.7z
mv *bootcd*.iso reactos_bootcd_latest.iso

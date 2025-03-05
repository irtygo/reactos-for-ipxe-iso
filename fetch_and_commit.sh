#!/bin/sh

echo "Fetching depedancies..."

sudo apt install 7zip

echo "Making dir $PWD/out"

mkdir out

echo "cd'ng to $PWD/out"

cd out

echo "Downloading the livecd iso"

curl https://iso.reactos.org/livecd/latest-x86-gcc-lin-rel -O out/reactos_livecd_latest.iso

echo "Downloading the bootcd iso"

curl https://iso.reactos.org/bootcd/latest-x86-gcc-lin-rel -O out/reactos_bootcd_latest.iso

git config --global user.name "irty-auto-ros"
git config --global user.email "github-actions@github.com"
git add artifact.txt
git commit -m $(printf "Update the ISOs at %s" $(date +"%a %d/%m/%Y"))
git push


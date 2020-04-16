#!/usr/bin/bash

cd AIK-Linux

echo "Please type the path of boot.img"
echo ""
read boot_path
cp $boot_path boot.img
./unpacking.sh boot.img
 rm ./split_images/boot-zImage
 mv Image ./split_images
 ./repacking.sh
 
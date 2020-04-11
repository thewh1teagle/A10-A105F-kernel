# A10-A105F-kernel
Kernel for Samsung Galaxy A10 (SM-A105F) (from Samsung Open Source Release Center)


Instructions:


1. 
root your device ( using magisk )

2. 
install twrp recovery

3.

get aarch64-linux-android-4.9 toolchain for compiling

4.

compile ( see README_Kernel.txt )

5. 

create a backup of current boot partition using adb and pull it.

adb shell
cat /tmp/recovery.log | grep /boot 
[ you will get the boot partition name ]
dd if=/dev/<partition> of=/external_sd/boot_backup.img
adb pull /external_sd/boot_backup.img

6.
repack boot.img with your new Image kernel you compiled using android image kitchen tool.
https://forum.xda-developers.com/showthread.php?t=2073775
./unpack boot_backup.img
replace zimage file in split_images directory and then repack
./repack

7.
push new image-boot.img to device.
adb push new-image.img /external_sd

8.
install the image with twrp to boot partition

9.
flash magisk zip file https://github.com/topjohnwu/Magisk/releases

10.
reboot

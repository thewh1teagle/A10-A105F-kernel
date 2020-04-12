echo "Don't forget to root your device using magisk"
sleep 1


## install tools

echo "installing tools."
sudo apt-get install git > /dev/null 2>&!

git clone https://github.com/mscalindt/aarch64-linux-android-4.9.git --progress

cd Kernel
export CROSS_COMPILE=../aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ANDROID_MAJOR_VERSION=10
make a10_00_defconfig
make menuconfig
make -j8


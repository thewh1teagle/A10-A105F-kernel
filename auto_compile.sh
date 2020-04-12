echo "Don't forget to root your device using magisk"
sleep 1


## install tools

echo "installing tools."
sudo apt-get install git > /dev/null 2>&1

url="https://github.com/mscalindt/aarch64-linux-android-4.9.git"
folder="aarch64-linux-android-4.9"
if ! git clone "${url}" "${folder}" 2>/dev/null && [ -d "${folder}" ] ; then
    echo "Clone failed because the folder ${folder} exists"
fi

cd Kernel
export CROSS_COMPILE=../aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ANDROID_MAJOR_VERSION=10
make clean && make distclean
make a10_00_defconfig
make menuconfig
make -j8
cp arch/arm64/boot/Image ../
echo "Compiled successfuly, Image file in folder."

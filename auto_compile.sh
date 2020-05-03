echo "Don't forget to root your device using magisk"

## install tools

echo "installing tools."
sudo apt-get install libncurses5-dev libncursesw5-dev bc

url="https://github.com/mscalindt/aarch64-linux-android-4.9.git"
folder="aarch64-linux-android-4.9"
echo "cloning toolchain..."
if ! git clone "${url}" "${folder}" && [ -d "${folder}" ] ; then
    echo "Clone failed because the folder ${folder} exists"
fi

cd Kernel
export CROSS_COMPILE=../aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ANDROID_MAJOR_VERSION=10
make clean && make distclean
make a10_00_defconfig


echo ""
echo ""
echo ""    
while true; do
    
    read -p "Do you wish to edit kernel using make menuconfig? " yn
    case $yn in
        [Yy]* ) echo "starting menuconfig...";make menuconfig; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

make -j8
cd ..
wget -nc "https://forum.xda-developers.com/attachment.php?attachmentid=4825093&d=1569201744" -O AIK.gz
tar xf AIK.gz
rm AIK.gz
cp Kernel/arch/arm64/boot/Image ./AIK-Linux
cd AIK-Linux
echo "Compiled successfuly, Image file in AIK_Linux folder."




while true; do

    read -p "Do you want to auto repack the compiled kernel Image? " yn
    case $yn in
        [Yy]* ) echo "starting repacking script...";
        [Nn]* ) exit 0;;
        * ) echo "Please answer yes or no.";;
    esac
done

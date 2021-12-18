#/bin/bash

wget https://archive.openwrt.org/chaos_calmer/15.05.1/x86/64/OpenWrt-SDK-15.05.1-x86-64_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2
tar -xf OpenWrt-SDK-15.05.1-x86-64_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2
cd OpenWrt-SDK-15.05.1-x86-64_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64
git clone https://github.com/ApertureG/minieap-openwrt.git package/minieap
git clone https://github.com/ApertureG/luci-app-minieap.git package/luci-app-minieap
git clone https://github.com/openwrt-dev/po2lmo.git
pushd po2lmo
make && sudo make install
popd
make defconfig
make package/minieap/compile V=s
make package/luci-app-minieap/compile V=s
find . -name *.ipk
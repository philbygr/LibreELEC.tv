# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_URL="https://github.com/jwrdegoede/rtl8189ES_linux.git"
PKG_VERSION="c223a25b1000d64432eca4201a8f012414dfc7ce"
PKG_GIT_CLONE_BRANCH="rtl8189fs"

PKG_NAME="RTL8189FS"
PKG_ARCH="arm"
PKG_LICENSE="GPL"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_LONGDESC="Realtek RTL8189FS Linux driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make  \
    M=$PKG_BUILD \
    ARCH=$TARGET_KERNEL_ARCH \
    KSRC=$(kernel_path) \
    CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
	all
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
  cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}



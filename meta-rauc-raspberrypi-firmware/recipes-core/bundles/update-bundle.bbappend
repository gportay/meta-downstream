FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://raspberrypi-firmware-hook.sh"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780"

RAUC_BUNDLE_HOOKS[file] = "raspberrypi-firmware-hook.sh"

RAUC_SLOT_rootfs[file] = "core-image-minimal-${MACHINE}.rootfs-p5.img"
RAUC_SLOT_rootfs[rename] = "rootfs.ext4"

RAUC_BUNDLE_SLOTS += "firmware"

RAUC_SLOT_firmware = "core-image-minimal"
RAUC_SLOT_firmware[file] = "core-image-minimal-${MACHINE}.rootfs-p2.img"
RAUC_SLOT_firmware[rename] = "firmware.vfat"
RAUC_SLOT_firmware[fstype] = "vfat"

RAUC_SLOT_rootfs[hooks] = "pre-install"
RAUC_SLOT_firmware[hooks] = "post-install"

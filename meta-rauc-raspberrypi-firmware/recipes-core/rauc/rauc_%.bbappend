FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

RDEPENDS:${PN} += "raspberrypi-firmware-rauc-bootloader-backend raspberrypi-firmware-systemd-generator"

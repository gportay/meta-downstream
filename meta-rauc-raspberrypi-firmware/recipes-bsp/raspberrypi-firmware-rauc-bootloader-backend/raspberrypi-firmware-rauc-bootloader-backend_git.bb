SUMMARY = "An implementation of a RAUC custom bootloader backend for the \
           Raspberry Pi firmware."
HOMEPAGE = "https://github.com/Rtone/raspberrypi-firmware-rauc-bootloader-backend"
BUGTRACKER = "https://github.com/Rtone/raspberrypi-firmware-rauc-bootloader-backend/issues"
LICENSE = "LGPL-2.1-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"

PV = "1.0+git${SRCPV}"
SRC_URI = "git://github.com/Rtone/raspberrypi-firmware-rauc-bootloader-backend.git;protocol=https;branch=main"
SRC_URI[sha256sum] = "422896ee160ddd896f47d4aa11cff9440d592b90cbf077de03bc009fa2a4d4ef"
SRCREV = "e30b1e9772d02c9ef1640c7d5fb3f9c1f7eb9217"

S = "${WORKDIR}/git"

do_configure() {
	:
}

do_compile() {
	:
}

do_install() {
	install -D -m755 ${S}/system-info ${D}${libdir}/raspberrypi-firmware-rauc-bootloader-backend/system-info
	install -D -m755 ${S}/bootloader-custom-backend ${D}${libdir}/raspberrypi-firmware-rauc-bootloader-backend/bootloader-custom-backend
}

RDEPENDS:${PN} += "bash userland dtc"
RRECOMMENDS:${PN} += "rauc"

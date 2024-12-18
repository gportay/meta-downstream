SUMMARY = "A systemd-generator for mounting the bootloader partitions of the \
           Raspberry Pi firmware."
HOMEPAGE = "https://github.com/Rtone/raspberrypi-firmware-systemd-generator"
BUGTRACKER = "https://github.com/Rtone/raspberrypi-firmware-systemd-generator/issues"
LICENSE = "LGPL-2.1-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"

PV = "1.0+git${SRCPV}"
SRC_URI = "git://github.com/Rtone/raspberrypi-firmware-systemd-generator.git;protocol=https;branch=main"
SRC_URI[sha256sum] = "53f0fb3fc281ec04fe61a13143efa72a8846185785d7cebd10ab055e60291e18"
SRCREV = "3139d6263259b3a4acec3b37b42fbdcf4de38052"

S = "${WORKDIR}/git"

inherit systemd

do_configure() {
	:
}

do_compile() {
	:
}

do_install() {
	install -D ${S}/raspberrypi-firmware-generator ${D}${libdir}/systemd/system-generators/raspberrypi-firmware-generator
}

RDEPENDS:${PN} += "bash vim-xxd"
FILES:${PN} += "${libdir}/systemd/system-generators/raspberrypi-firmware-generator"

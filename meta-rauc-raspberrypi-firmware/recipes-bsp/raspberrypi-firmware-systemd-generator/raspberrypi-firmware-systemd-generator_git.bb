SUMMARY = "A systemd-generator for mounting the bootloader partitions of the \
           Raspberry Pi firmware."
HOMEPAGE = "https://github.com/gportay/raspberrypi-firmware-systemd-generator"
BUGTRACKER = "https://github.com/gportay/raspberrypi-firmware-systemd-generator/issues"
LICENSE = "LGPL-2.1-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"

PV = "1.0+git${SRCPV}"
SRC_URI = "git://github.com/gportay/raspberrypi-firmware-systemd-generator.git;protocol=https;branch=main"
SRC_URI[sha256sum] = "5081d950dcd319bd1eb6bc01b86f869c98b04e1699173d22537e36d7cbc82dd0"
SRCREV = "7273665506b23c950a9c1855e9c7521ae1fb5848"

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

RDEPENDS:${PN} += "bash"
FILES:${PN} += "${libdir}/systemd/system-generators/raspberrypi-firmware-generator"

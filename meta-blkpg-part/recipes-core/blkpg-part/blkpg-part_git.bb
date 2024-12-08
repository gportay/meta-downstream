SUMMARY = "Partition table and disk geometry handling utility"
DESCRIPTION = "blkpg-part creates, resizes and deletes partitions on the fly \
               without writing back the changes to the partition table."
HOMEPAGE = "https://github.com/gportay/blkpg-part"
BUGTRACKER = "https://github.com/gportay/blkpg-part/issues"
LICENSE = "LGPL-2.1-or-later"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"

SRC_URI = "git://git@github.com/gportay/blkpg-part.git;protocol=ssh;branch=master \
           file://blkpgtab \
           "
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

do_install() {
	install -d ${D}${sbindir}/
	install -m 755 ${B}/blkpg-part ${D}${sbindir}/
	install -d ${D}${systemd_unitdir}/system-generators/
	install -m 755 ${B}/blkpgtab-generator ${D}${systemd_unitdir}/system-generators/
	# Warn if blkpgtag was not overwritten
	if ! grep -q "^[^#]" ${UNPACKDIR}/blkpgtab; then
		bbwarn "Please overwrite example blkpgtab with a project specific one!"
	fi
	install -d ${D}${sysconfdir}/
	install -m 644 ${UNPACKDIR}/blkpgtab ${D}${sysconfdir}/
}

FILES:${PN} += "${sysconfdir}/blkpgtab \
                ${systemd_unitdir}/system-generators/blkpgtab-generator \
                "

RDEPENDS:${PN} += "bash"

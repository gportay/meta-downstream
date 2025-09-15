FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_install:append() {
        sed -e 's,^compatible=.*$,compatible=${MACHINE},' \
            -i ${D}${sysconfdir}/rauc/system.conf
}

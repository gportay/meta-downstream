RDEPENDS:${PN} += "${PN}-xxd"

PACKAGES =+ "${PN}-xxd"
FILES:${PN}-xxd = "${bindir}/xxd"
RPROVIDES:${PN}-xxd = "xxd"

ALTERNATIVE:${PN}:remove= " xxd"
ALTERNATIVE:${PN}-xxd = "xxd"

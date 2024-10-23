pkg_postinst:${PN}:append () {
touch $D${libdir}/clock-epoch
}

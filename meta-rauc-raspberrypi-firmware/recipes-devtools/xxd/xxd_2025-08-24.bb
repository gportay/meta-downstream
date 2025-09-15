SUMMARY = "hexdump facility from vim"
HOMEPAGE = "https://www.vim.org/"
BUGTRACKER = "https://github.com/vim/vim/issues"
SECTION = "console/utils"
LICENSE = "X11 | GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${S}/src/xxd/xxd.c;beginline=1;endline=80;md5=4bfa55d0ef10dd4b4a7c188a3c4996bf"

SRC_URI = "git://github.com/vim/vim.git;protocol=https;branch=master"
SRCREV = "542cc4b35c1dba35634e3ee22081f267153186d0"

S = "${WORKDIR}/git"

do_compile() {
	oe_runmake -C ${S}/src/xxd xxd
}

do_install() {
	install -D -m 0755 ${S}/src/xxd/xxd ${D}${bindir}/xxd
}

DESCRIPTION = "Generated autoboot.txt file for the Raspberry Pi. \
               The Raspberry Pi autoboot.txt file is read by the GPU before \
               the ARM core is initialised. It can be used to specify the boot \
               partition number. It can also be used in conjuncion with the \
               tryboot feature to implement A/B booting for OS upgrades."

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

COMPATIBLE_MACHINE = "^rpi$"

SRC_URI = "file://autoboot.txt"

PR = "r1"

INHIBIT_DEFAULT_DEPS = "1"

inherit deploy nopackages

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"

do_deploy() {
    install -d ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}
    cp ${UNPACKDIR}/autoboot.txt ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/autoboot.txt

    # Warn about too long lines!
    if grep -q -E '^.{80}.$' ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/autoboot.txt; then
        bbwarn "autoboot.txt contains lines longer than 80 characters, this is not supported"
    fi

    # Warn about too big file!
    size=$(stat -c '%s' ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/autoboot.txt)
    if [ "$size" -gt 512 ]; then
        bbfatal "autoboot.txt larger than 512 is not supported"
    fi
}
do_deploy[vardeps] += "${RPI_CONFIG_STRIP}"

addtask deploy before do_build after do_install
do_deploy[dirs] += "${DEPLOYDIR}/${BOOTFILES_DIR_NAME}"

PACKAGE_ARCH = "${MACHINE_ARCH}"

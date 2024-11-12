FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

RDEPENDS:${PN} += "raspberrypi-firmware-rauc-bootloader-backend raspberrypi-firmware-systemd-generator"

do_install:append() {
        sed -e "/^ConditionKernelCommandLine=|bootchooser.active/d" \
            -e "/^ConditionKernelCommandLine=|rauc.slot/d" \
            -i ${D}${systemd_unitdir}/system/rauc-mark-good.service
}

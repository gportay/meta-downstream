python do_bootimg() {
    flags = d.getVarFlags("build_efi_cfg")
    if flags and flags.get("func"):
        bb.build.exec_func("build_efi_cfg", d)
}

addtask bootimg before do_image_complete after do_rootfs

python __anonymous() {
    verity_image = d.getVar('DM_VERITY_IMAGE')
    verity_type = d.getVar('DM_VERITY_IMAGE_TYPE')
    image_fstypes = d.getVar('IMAGE_FSTYPES')
    pn = d.getVar('PN')

    if not verity_image or not verity_type:
        bb.warn('dm-verity-img class inherited but not used')
        return

    if len(verity_type.split()) != 1:
        bb.fatal('DM_VERITY_IMAGE_TYPE must contain exactly one type')

    if 'wic' in image_fstypes:
        dep = ' %s:do_bootimg' % pn
        d.appendVarFlag('do_image_wic', 'depends', dep)
}

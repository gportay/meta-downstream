INITRDDIR = "${S}/initrd"

populate_initrd() {
	# initrd is made of concatenation of multiple filesystem images
	if [ -n "${INITRD}" ]; then
		dest=$1
		install -d $dest

		rm -f $dest/initrd
		for fs in ${INITRD}
		do
			if [ -s "$fs" ]; then
				cat $fs >> $dest/initrd
			else
				bbfatal "$fs is invalid. initrd image creation failed."
			fi
		done
		chmod 0644 $dest/initrd
	fi
}

build_initrd() {
	populate_initrd ${INITRDDIR}
}

python do_bootimg() {
    flags = d.getVarFlags("build_efi_cfg")
    if flags and flags.get("func"):
        bb.build.exec_func("build_efi_cfg", d)
    bb.build.exec_func('build_initrd', d)
}

addtask bootimg before do_image_complete after do_rootfs

python __anonymous() {
    initramfs_image = d.getVar('INITRAMFS_IMAGE')
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

        dep = ' %s:do_image_complete' % initramfs_image
        d.appendVarFlag('do_bootimg', 'depends', dep)
}

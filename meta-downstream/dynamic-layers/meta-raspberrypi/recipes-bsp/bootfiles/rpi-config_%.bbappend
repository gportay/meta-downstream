do_deploy:append() {
    # Initial RAM filesystem image support
    if [ "${INITRAMFS_IMAGE}" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
        sed -i '/#ramfsfile=/ c\ramfsfile=initramfs.img' $CONFIG
        sed -i '/#ramfsaddr=/ c\ramfsaddr=-1' $CONFIG
    fi
}

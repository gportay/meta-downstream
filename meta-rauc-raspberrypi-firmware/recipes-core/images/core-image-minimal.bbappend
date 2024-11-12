IMAGE_CMD:wic:append() {
    basename="$(basename "${wks%.wks}")"
    cp "$build_wic/$basename-"*".direct.p2" "$out-p2.img"
    ln -sf ${IMAGE_NAME}-p2.img "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}-p2.img"
    cp "$build_wic/$basename-"*".direct.p5" "$out-p5.img"
    ln -sf ${IMAGE_NAME}-p5.img "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}-p5.img"
}

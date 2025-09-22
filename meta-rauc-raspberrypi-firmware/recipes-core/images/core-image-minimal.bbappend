IMAGE_CMD:wic:append() {
    basename="$(basename "${wks%.wks}")"
    for i in "$build_wic/$basename-"*".p"*; do
        p="${i##*.p}"
        cp "$i" "$out-p$p.img"
        ln -sf "${IMAGE_NAME}-p$p.img" "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}-p$p.img"
    done
}

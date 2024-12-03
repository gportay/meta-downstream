include recipes-core/bundles/qemu-demo-bundle.bb

DESCRIPTION = "RAUC bundle generator"

RAUC_BUNDLE_VERSION = "v20241203"
RAUC_BUNDLE_DESCRIPTION = "RAUC Demo Bundle"

RAUC_KEY_FILE ?= "${THISDIR}/files/development-1.key.pem"
RAUC_CERT_FILE ?= "${THISDIR}/files/development-1.cert.pem"

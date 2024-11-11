# SPDX-License-Identifier: LGPL-2.1-only
# SPDX-FileCopyrightText: Copyright 2024 Gaël PORTAY

objtree = .
srctree = .

ifeq ("$(origin V)", "command line")
KBUILD_VERBOSE = $(V)
endif

ifeq ("$(origin O)", "command line")
KAS_BUILD_DIR = $(realpath $(O))
export KAS_BUILD_DIR
endif

KAS_WORK_DIR = $(CURDIR)
export KAS_WORK_DIR

CONFIG_YAML_FILE = .config.yaml

.PHONY: all
all: | .config.yaml
	kas build

.PHONY: menu
menu:
	kas menu

xxx:
	kas dump configs/$@ >.$@
	yq -Y --indent 4 '. * {"header": {"includes": ["configs/$@"]}}' -i .$@
	kas dump .$@ >.config.yaml
	#rm -f .$@

.SILENT: .config.yaml
.config.yaml:
	echo "Configuration file "$@" not found!" >&2
	echo "Please run make menuconfig." >&2
	false

saveconfig.yaml:
	kas dump >$@

.PHONY: checkout build shell
checkout build shell: | .config.yaml
	kas $@

.PHONY: runqemu
runqemu: | .config.yaml
	kas shell -c "runqemu nographic"

.PHONY: clean
clean: mostlyclean
	rm -Rf build/
	rm -f .config.yaml.old

.PHONY: mostlyclean
mostlyclean:
	rm -f .config.yaml

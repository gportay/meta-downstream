# SPDX-License-Identifier: LGPL-2.1-only
# SPDX-FileCopyrightText: Copyright 2024 Gaël PORTAY

.PHONY: all
all: | .config.yaml
	kas build

.PHONY: menu
menu:
	kas menu

.SILENT: .config.yaml
.config.yaml:
	echo "Configuration file "$@" not found!" >&2
	echo "Please run make menuconfig." >&2
	false

.PHONY: checkout dump build shell
checkout dump build shell: | .config.yaml
	kas $@

.PHONY: runqemu
runqemu: | .config.yaml
	kas shell -c "runqemu nographic slirp"

.PHONY: clean
clean: mostlyclean
	rm -Rf build/
	rm -f .config.yaml.old

.PHONY: mostlyclean
mostlyclean:
	rm -f .config.yaml .config.yaml.old

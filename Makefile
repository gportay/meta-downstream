# SPDX-License-Identifier: LGPL-2.1-only
# SPDX-FileCopyrightText: Copyright 2024-2026 Gaël PORTAY

.PHONY: all
all: | .config.yaml
	kas build

$(foreach yaml,$(wildcard configs/*.yaml),$(notdir $(yaml))):
%.yaml:
	cp configs/$@ .config.yaml

.PHONY: saveyaml
saveyaml:
	kas dump | yq -r .machine
	cp .config.yaml config.yaml

.PHONY: menu menuconfig
menu menuconfig:
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

.PHONY: lock
lock: | .config.yaml
	kas lock

.PHONY: overrides-lockfile.yaml
overrides-lockfile.yaml:
	kas dump --lock kas-project.yaml >$@

.PHONY: clean
clean: mostlyclean
	rm -Rf build/

.PHONY: mostlyclean
mostlyclean: clean
	rm -f .config.yaml .config.yaml.old

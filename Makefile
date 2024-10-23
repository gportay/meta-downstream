# SPDX-License-Identifier: LGPL-2.1-only
# SPDX-FileCopyrightText: Copyright 2024 Gaël PORTAY

.PHONY: all
all:
	kas build kas-project.yml

.PHONY: checkout build shell
checkout build shell:
	kas $@ kas-project.yml

.PHONY: runqemu
runqemu:
	kas shell kas-project.yml -c "runqemu nographic"

.PHONY: clean
clean:
	rm -Rf build/

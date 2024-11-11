# meta-downstream

OpenEmbedded meta layer with downstream recipes and changes for upstream.

## TL;DR;

This repository builds firmwares using the [Yocto Project] for Intel Core 2
microprocessors or Raspberry Pi single-board computers (64-bit). It sets up the
OpenEmbedded layers and runs bitbake using the [kas] setup tool.

## REQUIREMENTS

Look at the Yocto Project Reference Manual [System Requirements] and the kas
User Guide [Dependencies and installation] sections to install all the bits
required to use that repository.

Also, consider installing the package `yq` if running commands from the handy
`Makefile` providing 

## KASBUILD

kasbuild is an imitation of the [Kbuild] system used by the [Linux kernel].

## DOWNLOAD

Clone the tree:

	git clone https://github.com/gportay/meta-downstream.git

And enter the sources:

	cd meta-downstream

## BUILD

Configure the firmware:

	kas menu

And buid it:

	kas build

It takes a while to cook the world, grab yourself a coffee or count the zeros
in `/dev/zero` in the meantime!

## TEST

Run the firmware:

	kas shell kas-project -c "runqemu nographic"

Login as **root**, run commands and poweroff the system or **Ctrl-a x** to exit
the emulator, have fun!

## BUGS

Report bugs at *https://github.com/gportay/meta-downstream/issues*

## AUTHOR

Written by Gaël PORTAY *gael.portay@rtone.fr*

## COPYRIGHT

Copyright 2024 Gaël PORTAY

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation, either version 2.1 of the License, or (at your option) any
later version.

[Dependencies and installation]: https://kas.readthedocs.io/en/next/userguide/getting-started.html#dependencies-installation
[System Requirements]: https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html
[Yocto Project]: https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html
[kas]: https://kas.readthedocs.io/en/latest/
[kbuild]: https://www.kernel.org/doc/html/latest/kbuild/index.html

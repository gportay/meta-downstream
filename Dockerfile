FROM debian:12

# https://github.com/moby/moby/issues/4032
ENV DPKG_FRONTEND=noninteractive

# https://docs.yoctoproject.org/ref-manual/system-requirements.html?highlight=host+packages#ubuntu-and-debian
RUN apt -y update && apt -y install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales
RUN locale-gen en_US.UTF-8

# https://github.com/buildroot/buildroot/blob/2564268f996dfb94ea2f0d1f776208bec63f6312/support/docker/Dockerfile#L27-L29
RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && /usr/sbin/locale-gen

# https://kas.readthedocs.io/en/4.5/userguide/getting-started.html#dependencies-installation
RUN pip install --break-system-packages --no-cache-dir --upgrade pip && pip install --break-system-packages kas==4.5

# https://github.com/moby/moby/issues/4032
ENV DPKG_FRONTEND=

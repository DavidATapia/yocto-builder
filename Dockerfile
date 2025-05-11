
FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

USER root

SHELL ["/bin/bash", "-c"]

# Apt packages
RUN apt-get update && apt-get install --yes --no-install-recommends \
        # required Yocto dependencies
        apt-utils \
        autoconf \
        automake \
        bison \
        build-essential \
        chrpath \
        cpio \
        debianutils \
        diffstat \
        file \
        flex \
        gawk \
        gcc-multilib \
        git \
        help2man \
        iproute2 \
        iputils-ping \
        less \
        libacl1 \
        libegl1-mesa \
        liblz4-tool \
        libncurses5-dev \
        libsdl1.2-dev \
        libtool-bin \
        locales \
        mesa-common-dev \
        net-tools \
        python3 \
        python3-git \
        python3-jinja2 \
        python3-pexpect \
        python3-pip \
        python3-subunit \
        qemu-system \
        socat \
        sudo \
        tar \
        texinfo \
        tree \
        unzip \
        wget \
        xterm \
        xz-utils \
        zstd \
        # NVIDIA initrd-flash dependencies
        abootimg \
        binfmt-support \
        binutils \
        bmap-tools \
        cpio \
        cpp \
        device-tree-compiler \
        dosfstools \
        gdisk \
        lbzip2 \
        nfs-kernel-server \
        openssl \
        rsync \
        ssh \
        sshpass \
        udev \
        udisks2 \
        uuid-runtime \
        whois \
        zstd \
        # Yocto doflash dependencies
        libxml2-utils \
        lz4 \
        python3-yaml \
        qemu-user-static \
        usbutils \
        && apt-get clean

# Pip packages
RUN pip install \
        kas \
        pip-tools

# Set locality because of 'noninteractive' install type
RUN locale-gen en_US && locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8

# Disable password prompt using 'sudo' for all members of sudo group
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

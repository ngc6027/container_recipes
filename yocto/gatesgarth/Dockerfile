FROM ubuntu:20.04

ENV TZ=America/New_York

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
	apt-get install -y \
	gawk \
	wget \
	git-core \
	diffstat \
	unzip \
	texinfo \
	gcc-multilib \
	build-essential \
	chrpath \
	socat \
	cpio \
	python3 \
	python3-pip \
	python3-pexpect \
	xz-utils \
	debianutils \
	iputils-ping \
	python3-git \
	python3-jinja2 \
	libegl1-mesa \
	libsdl1.2-dev \
	pylint3 \
	xterm \
	python3-subunit \
	mesa-common-dev \
	locales \
	vim \
	bash-completion \
	screen

ARG USERNAME=dev

RUN groupadd -g 1000 ${USERNAME} \
	&& useradd -u 1000 -g ${USERNAME} -d /home/${USERNAME} ${USERNAME} \
	&& mkdir /home/${USERNAME} \
	&& chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8

COPY ./bashrc /home/${USERNAME}/.bashrc

USER ${USERNAME}

RUN cd /home/${USERNAME} && git clone --recurse-submodules -b gatesgarth git://git.yoctoproject.org/poky

WORKDIR /home/${USERNAME}

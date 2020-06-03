#!/usr/bin/env fish

git clone https://github.com/universal-ctags/ctags.git ~/code/ctags

sudo apt install \
	gcc make \
	pkg-config autoconf automake \
	python3-docutils \
	libseccomp-dev \
	libjansson-dev \
	libyaml-dev \
	libxml2-dev

cd ~/code/ctags
./autogen.sh
./configure
make
sudo make install

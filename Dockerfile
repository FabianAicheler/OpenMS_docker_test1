FROM ubuntu:12.04

RUN \
apt-get -y update && \
apt-get install -y cmake g++ autoconf qt4-dev-tools patch libtool make git \
libqt4-core libqt4-dev libqt4-gui libqt4-opengl-dev automake libqtwebkit-dev \
libboost-regex-dev libboost-iostreams-dev libboost-date-time-dev libboost-math-dev \
libsvm-dev libglpk-dev libzip-dev zlib1g-dev libxerces-c-dev libbz2-dev && \
git clone https://github.com/OpenMS/contrib.git  && \
mkdir contrib-build
WORKDIR /contrib-build
RUN cmake -DBUILD_TYPE=SEQAN ../contrib && \
cmake -DBUILD_TYPE=WILDMAGIC ../contrib && \
cmake -DBUILD_TYPE=EIGEN ../contrib

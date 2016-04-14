# Concatenated script to build OpenMS
# 
#  - downloads the OpenMS dependencies to /contrib and builds them in the
#    folder /contrib-build
#
#  - downloads the OpenMS source code to /OpenMS and builds the code in the
#    folder /openms-build
#

FROM ubuntu:12.04

RUN \
apt-get autoremove && \
apt-get clean && \
apt-get -y update && \
apt-get install -y cmake g++ autoconf qt4-dev-tools patch libtool make git && \
# for add-apt-repository, used to get repo for newer boost version
apt-get install -y software-properties-common python-software-properties && \
add-apt-repository --yes ppa:boost-latest/ppa && \
apt-get update && \
# install dependencies
apt-get install -qq libsvm-dev libglpk-dev libzip-dev zlib1g-dev libxerces-c-dev libbz2-dev && \
apt-get install -qq libboost-date-time1.54-dev \
                    libboost-iostreams1.54-dev \
                    libboost-regex1.54-dev \
                    libboost-math1.54-dev \
                    libboost-random1.54-dev && \
apt-get clean && \
git clone https://github.com/OpenMS/contrib.git  && \
mkdir contrib-build
WORKDIR /contrib-build
RUN cmake -DBUILD_TYPE=SEQAN ../contrib && \
cmake -DBUILD_TYPE=WILDMAGIC ../contrib && \
cmake -DBUILD_TYPE=EIGEN ../contrib

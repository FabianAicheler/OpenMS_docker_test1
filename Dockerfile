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
apt-get install -y cmake && \
apt-get clean && \
apt-get install -y g++ && \
apt-get clean && \
apt-get install -y autoconf && \
apt-get clean && \
apt-get install -y qt4-dev-tools && \
apt-get clean && \
apt-get install -y patch && \
apt-get clean && \
apt-get install -y libtool && \
apt-get clean && \
apt-get install -y make && \
apt-get clean && \
apt-get install -y git && \
# for add-apt-repository, used to get repo for newer boost version
apt-get install -y software-properties-common  && \
apt-get clean && \
apt-get install -y python-software-properties && \
add-apt-repository --yes ppa:boost-latest/ppa && \
apt-get update && \
# install dependencies
apt-get install -qq libsvm-dev && \
apt-get clean && \
apt-get install -y libglpk-dev  && \
apt-get clean && \
apt-get install -y libzip-dev  && \
apt-get clean && \
apt-get install -y zlib1g-dev  && \
apt-get clean && \
apt-get install -y libxerces-c-dev  && \
apt-get clean && \
apt-get install -y libbz2-dev && \
apt-get install -qq libboost-date-time1.54-dev && \
apt-get clean && \
apt-get install -qq libboost-iostreams1.54-dev && \
apt-get clean && \
apt-get install -qq libboost-regex1.54-dev && \
apt-get clean && \
apt-get install -qq libboost-math1.54-dev && \
apt-get clean && \
apt-get install -qq libboost-random1.54-dev && \
apt-get clean && \
git clone https://github.com/OpenMS/contrib.git  && \
mkdir contrib-build
WORKDIR /contrib-build
RUN cmake -DBUILD_TYPE=SEQAN ../contrib && \
cmake -DBUILD_TYPE=WILDMAGIC ../contrib && \
cmake -DBUILD_TYPE=EIGEN ../contrib

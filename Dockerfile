FROM fabianaicheler/openms_docker_test1:contrib_sr_buildinstructions

WORKDIR /
RUN git clone https://github.com/OpenMS/OpenMS.git
RUN mkdir openms-build

WORKDIR /openms-build

RUN cmake -DCMAKE_PREFIX_PATH="/contrib-build/;/usr/;/usr/local" -DBOOST_USE_STATIC=OFF ../OpenMS
RUN make OpenMS

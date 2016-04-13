#  - downloads the OpenMS source code to /OpenMS and builds the code in the
#    folder /openms-build
#

FROM fabianaicheler/openms_hroest_contrib 

WORKDIR /
RUN git clone https://github.com/OpenMS/OpenMS.git
RUN mkdir openms-build

WORKDIR /openms-build

RUN cmake -DCMAKE_PREFIX_PATH="/contrib-build/;/usr/;/usr/local" -DBOOST_USE_STATIC=OFF ../OpenMS
RUN make OpenMS


## End of library, the above image should be available at
## hroest/openms_lib, therefore we could start here with 
## FROM hroest/openms_lib 

#WORKDIR /openms-build

#RUN make 

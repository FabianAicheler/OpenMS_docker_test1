FROM fabianaicheler/openms_hroest_contrib:library

WORKDIR /openms-build

RUN make 

FROM resin/raspberrypi3-debian:stretch

#steps from https://movidius.github.io/blog/ncs-apps-on-rpi/

#step 1 Install Debian and Python dependencies

nstall necessary packages for the installer
RUN apt-get update && apt-get install -y \
    build-essential \
    sed \
    sudo \
    tar \
    udev \
    wget \
    && apt-get clean

#step 2 Download NCSDK onto your Pi
RUN mkdir -p /github
WORKDIR /github
RUN git clone https://github.com/movidius/ncsdk.git

#step 2.5 Add missing packages
#RUN sudo apt-get install -y make wget

#step 3 Compile and install NCSDK’s API framework
WORKDIR /github/ncsdk/api/src
RUN make
RUN sudo make install --ignore-errors

#step 4 Test installation using sample code from NC App Zoo
WORKDIR /github
RUN git clone https://github.com/movidius/ncappzoo.git

WORKDIR /github/ncappzoo/apps/hello_ncs_py

RUN echo "DONE! Run the following command:"
RUN echo "sudo docker run --net=host -v /dev:/dev --privileged -it <imagename:tag>  /bin/bash"


FROM resin/raspberrypi3-debian:stretch

#steps from https://movidius.github.io/blog/ncs-apps-on-rpi/

#step 1 Install Debian and Python dependencies
RUN sudo apt-get update \
    && apt-get upgrade -y \
    && sudo apt-get install -y \
        git \
        libusb-1.0-0-dev \
        libprotobuf-dev \
        libleveldb-dev \
        libsnappy-dev \
        libopencv-dev \
        libhdf5-serial-dev \
        protobuf-compiler \
        libatlas-base-dev \
        automake \
        byacc \
        lsb-release \
        cmake \
        libgflags-dev \
        libgoogle-glog-dev \
        liblmdb-dev \
        swig3.0 \
        graphviz \
        libxslt-dev \
        libxml2-dev \
        gfortran \
        python3-dev \
        python-pip \
        python3-pip \
        python3-setuptools \
        python3-markdown \
        python3-pillow \
        python3-yaml \
        python3-pygraphviz \
        python3-h5py \
        python3-nose \
        python3-lxml \
        python3-matplotlib \
        python3-numpy \
        python3-protobuf \
        python3-dateutil \
        python3-skimage \
        python3-scipy \
        python3-six \
        python3-networkx \
        python3-tk 

#step 2 Download NCSDK onto your Pi
RUN mkdir -p /github
WORKDIR /github
RUN git clone https://github.com/movidius/ncsdk.git

#step 2.5 Add missing packages
RUN sudo apt-get install -y make wget

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


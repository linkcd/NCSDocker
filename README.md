Introduction
This Dockerfile can be used to easily build a Docker image that has the first generation of Intel® Movidiu Neural Comput API (Not whole SDK) installed on raspberry pi.

## Build the image
Use the following command to build the image:
$ docker build -t ncsdk -f Dockerfile .

This creates an image named "ncsdk".


## Run the container
After the image is built, execute the following command to run the container that we named "ncsdk":
$ docker run --net=host --privileged -v /dev:/dev --name ncsdk -i -t ncsdk /bin/bash


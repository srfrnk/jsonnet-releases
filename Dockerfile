FROM ubuntu
SHELL ["/bin/bash","-c"]
RUN apt-get update &&\
    apt-get -y install git curl make build-essential
ADD .gitignore /
ENV VERSION="0.10.0"
RUN cd / && git clone https://github.com/google/jsonnet
WORKDIR /jsonnet
RUN git checkout v$VERSION
RUN make -j4 OPT="-O3 -static"


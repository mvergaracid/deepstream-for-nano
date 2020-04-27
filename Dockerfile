FROM nvcr.io/nvidia/deepstream:4.0.1-19.09-base
WORKDIR /root/deepstream_sdk_v4.0.1_x86_64
RUN apt-get update
RUN apt-get install -y \
    libssl1.0.0 \
    libgstreamer1.0-0 \
    libgstreamer1.0-dev \ 
    libgstreamer-plugins-base1.0-dev \
    libgstrtspserver-1.0-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    libgstrtspserver-1.0-0 \
    libjansson4 \
    gcc
COPY ./binaries.tbz2 ./install/binaries.tbz2
COPY ./install.sh ./install/install.sh
WORKDIR /root/deepstream_sdk_v4.0.1_x86_64/install
RUN tar -xvpf binaries.tbz2 -C /
RUN ./install.sh
WORKDIR /root/deepstream_sdk_v4.0.1_x86_64

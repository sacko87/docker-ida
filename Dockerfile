FROM debian:jessie
RUN apt-key update               \   
 && dpkg --add-architecture i386 \
 && apt-get update               \   
 && apt-get -y install curl libglib2.0-0:i386 libgtk2.0-bin:i386 ca-certificates \
                       libstdc++6:i386 libsm6:i386 --no-install-recommends       \   
 && apt-get -y clean

ENV IDA_VERSION 6.8 
ENV IDA_DOWNLOAD_URL https://out7.hex-rays.com/files/idademo68_linux.tgz
ENV IDA_DOWNLOAD_SHA1 84a143b971bff4b6aac0d250d2eb3d0a761230e9

WORKDIR /opt

RUN curl -sSL "${IDA_DOWNLOAD_URL}" -o ida.tgz              \   
 && echo "${IDA_DOWNLOAD_SHA1} ida.tgz" | sha1sum -c -      \   
 && mkdir /opt/ida && tar -zxf ida.tgz -C /opt/ida --strip-components 1 \ 
 && rm ida.tgz

CMD /opt/ida/idaq

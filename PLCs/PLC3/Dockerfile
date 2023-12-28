FROM ubuntu:18.04

USER root
WORKDIR /root/
RUN apt-get update && \
    apt-get -y install vim nano software-properties-common git python-pip autoconf bison build-essential pkg-config bison flex autoconf automake libtool make git python2.7 python-pip sqlite3 cmake sudo
RUN pip install flask flask-login pyserial pymodbus

RUN apt-get update \
  && apt-get install -y wget gcc make openssl libffi-dev libgdbm-dev libsqlite3-dev libssl-dev zlib1g-dev \
  && apt-get clean

WORKDIR /home/

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt-get update 
RUN apt-get install -y python3.7  libevent-dev libdumbnet-dev libpcap-dev libpcre3-dev libedit-dev bison flex libtool automake git zlib1g-dev make

RUN echo "alias python=python3.7" >> ~/.bashrc
RUN export PATH=${PATH}:/usr/bin/python3.7
RUN /bin/bash -c "source ~/.bashrc"

# Install pip
RUN apt install python3-pip -y
RUN python3 -m pip install --upgrade pip

RUN pip install snmpsim==0.4.7 pyasn1==0.4.8

COPY ./data /data

WORKDIR /home/

RUN git clone https://github.com/thiagoralves/OpenPLC_v3.git
WORKDIR /home/OpenPLC_v3/
RUN ls -al install.sh
RUN sudo chmod +x install.sh
RUN sudo ./install.sh linux

RUN mkdir /home/OpenPLC_v3/scripts

COPY run.sh /home/OpenPLC_v3/
RUN sudo chmod +x run.sh
COPY PLC3.st /home/OpenPLC_v3/scripts
COPY launch.sh /home/OpenPLC_v3/launch.sh

EXPOSE 502
EXPOSE 6668/udp
EXPOSE 8080
EXPOSE 47
EXPOSE 67
EXPOSE 68
EXPOSE 161

CMD sudo echo '192.168.10.106  plc1.net' >> /etc/hosts && echo '192.168.10.107  plc2.net' >> /etc/hosts && echo '192.168.10.108  plc3.net' >> /etc/hosts; sh /home/OpenPLC_v3/run.sh; snmpsimd.py --data-dir=/data --agent-udpv4-endpoint=0.0.0.0:161 --v2c-arc

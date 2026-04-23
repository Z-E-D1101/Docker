FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    openssh-server \
    sudo \
    curl \
    wget \
    nano \
    net-tools \
    iputils-ping \
    && mkdir /var/run/sshd

# set password root (ubah sesuai kebutuhan)
RUN echo 'root:root123' | chpasswd

# aktifkan SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

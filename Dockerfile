FROM centos:8

LABEL website="sangchul.kr"

ARG OS_USER1
ARG OS_USER1_PASSWD
ENV OS_ROOT_PASSWD="root"
ENV OS_USER1=${OS_USER1:-centos}
ENV OS_USER1_PASSWD=${OS_USER1_PASSWD:-centos}

USER root

RUN sed -i "s/mirrorlist=/#mirrorlist=/g" /etc/yum.repos.d/CentOS-* \
  && sed -i "s/#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-* \
  && yum install -y systemd sudo passwd shadow-utils \
    openssh-server openssh-clients \
    # wget git\
    net-tools iputils vim \
  && yum clean all \
  && rm -rf /var/cache/dnf

RUN echo "root:$OS_ROOT_PASSWD" | chpasswd
RUN echo 'export PS1="\[\e[33m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:\[\033[01;31m\]\W\[\e[m\]$ "' >> ~/.bashrc
# RUN source ~/.bashrc

RUN useradd -rm -d /home/$OS_USER1 -s /bin/bash -G wheel $OS_USER1 \
  && mkdir -m 700 /home/$OS_USER1/.ssh \
  && echo "$OS_USER1":"$OS_USER1_PASSWD" | chpasswd \
  && echo -e "$OS_USER1\tALL=(ALL)\tNOPASSWD:ALL" >> /etc/sudoers

WORKDIR /root

EXPOSE 22

CMD ["/bin/bash"]






###docker build
# docker build --tag anti1346/centos8-sshd:latest --no-cache .

FROM centos:8

LABEL website="sangchul.kr"

# ENV PS1A="\[\e[33m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:\[\033[01;31m\]\W\[\e[m\]$ "

# RUN echo 'PS1=$PS1A' >> ~/.bashrc

RUN sed -i -e "s/mirrorlist=/#mirrorlist=/g" /etc/yum.repos.d/CentOS-* \
  && sed -i -e "s/#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-* \
  && yum install -y systemd sudo passwd \
    openssh-server openssh-clients \
    net-tools vim \
  && yum clean all

USER root

# RUN mkdir /var/run/sshd \
#   && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
#   && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config \
#   && sed -i 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN echo 'root:root' | chpasswd
RUN echo 'export PS1="\[\e[33m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:\[\033[01;31m\]\W\[\e[m\]$ "' >> ~/.bashrc
# RUN source ~/.bashrc

RUN useradd -rm -d /home/centos -s /bin/bash -G sudo centos \
  && mkdir -m 700 /home/centos/.ssh \
  && echo 'centos:centos' | chpasswd \
  && echo "centos\tALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# RUN service ssh start

WORKDIR /root

EXPOSE 22

CMD ["/bin/bash"]

# systemctl restart sshd
# systemctl status sshd

###docker build
# docker build --no-cache -t anti1346/centos8-sshd:latest .

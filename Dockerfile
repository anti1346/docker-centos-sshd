FROM centos:8

LABEL website="sangchul.kr"

ENV PS1A="\[\e[33m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:\[\033[01;31m\]\W\[\e[m\]$ "

RUN echo 'PS1=$PS1A' >> ~/.bashrc

RUN sed -i -e "s/mirrorlist=/#mirrorlist=/g" /etc/yum.repos.d/CentOS-* \
  && sed -i -e "s/#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-* \
  && yum clean all \
  && yum install -y systemd sudo passwd openssh-server openssh-clients net-tools vim


# systemctl restart sshd
# systemctl status sshd




###docker build
# docker build --no-cache -t anti1346/centos8-sshd:latest .

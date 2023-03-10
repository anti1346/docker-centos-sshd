# docker centos sshd(openssh server)

##### docker build
```
docker build --tag anti1346/centos8-sshd:latest --no-cache .
```
##### docker build arg
```
docker build --tag anti1346/centos8-sshd:latest --build-arg OS_USER1=vagrant --build-arg OS_USER1_PASSWD=vagrant --no-cache .
```
##### docker tag(도커 이미지 태그 이름 변경)
```
docker tag anti1346/centos8-sshd:latest anti1346/centos8-sshd:latest
```
##### docker push
```
docker push anti1346/centos8-sshd:latest
```
##### docker run test
```
docker run -it --rm anti1346/centos8-sshd:latest
```
##### ssh(sshd) start
```
systemctl start sshd
```

## docker privileged mode test
##### docker network
```
docker network create vnetwork
```
##### docker run
```
docker run -d --privileged --cap-add=SYS_ADMIN --net vnetwork --name centos8 -h centos8 anti1346/centos8-sshd:latest /sbin/init
```
```
docker exec -it centos8 bash
```
##### ssh(sshd) start
```
systemctl restart sshd
```

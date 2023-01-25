# docker centos sshd(openssh server)

##### docker build
```
docker build --no-cache --tag anti1346/centos8-sshd:latest .
```
##### docker tag
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

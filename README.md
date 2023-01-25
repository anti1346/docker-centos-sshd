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





## docker vault test
##### docker network
```
docker network create vnetwork
```
##### docker run
```
docker run -d --privileged --cap-add=SYS_ADMIN --name auth-server -h auth-server --net vnetwork anti1346/centos8-sshd:latest bash
```
```
docker exec -it auth-server bash
```
```
docker run -d --privileged --cap-add=SYS_ADMIN --name ssh-server -h ssh-server --net vnetwork anti1346/centos8-sshd:latest bash
```
```
docker exec -it ssh-server bash
```
```
docker run -d --privileged --cap-add=SYS_ADMIN --name ssh-client -h ssh-client --net vnetwork anti1346/centos8-sshd:latest bash
```
```
docker exec -it ssh-client bash
```
##### ssh(sshd) start
```
systemctl restart sshd
```

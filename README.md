# Cluster K8S com NFS

Este projeto tem como objetivo criar um cluster k8s com NFS(Network File System) para estudos utilizando o vagrant.

Serão criadas 4 máquinas sendo elas:

* master  - Máquina master do cluster k8s.
* minion1 - Nó 1 do cluster k8s. 
* minion2 - Nó 2 do cluster k8s. 
* storage - Servidor NFS (Network File System)

### Pré-Requisitos:

Vagrant (https://www.vagrantup.com/docs/installation)
VirtualBox(https://www.virtualbox.org/wiki/Downloads)

### Passo a Passo da instalação:

```
git clone https://github.com/leoberbert/cluster-dev-k8s.git

cd cluster-dev-k8s
```
Agora basta executar o comando abaixo e aguardar todo o ambiente ser criado.
```
vagrant up
```
Após o término iremos verificar se nosso ambiente encontra-se criado e pronto para utilização.

Mapa de IP/Host:
```
172.27.11.10 - master
172.27.11.20 - minion1
172.27.11.30 - minion2
172.27.11.40 - storage
```
Acessem a máquina master para verificarmos se o cluster encontra-se funcionando:

```
vagrant@master:~/vagrant$ kubectl get nodes
NAME      STATUS   ROLES    AGE    VERSION
master    Ready    master   5d1h   v1.18.3
minion1   Ready    <none>   5d1h   v1.18.3
minion2   Ready    <none>   5d1h   v1.18.3
```
Nas máquinas minion1 e minion2 precisaremos montar o disco para trabalhar com o NFS e gravar os arquivos na máquina storage:

```
vagrant@minion1:~$ sudo mount -t nfs 172.27.11.40:/volumes/v1 /mnt
vagrant@minion2:~$ sudo mount -t nfs 172.27.11.40:/volumes/v1 /mnt 
```
Iremos criar um arquivo nas máquinas minion1 e minion2 e verificar se o arquivo será armazenado na maquina storage:

```
vagrant@minion1:/mnt$ cd /mnt/; sudo touch minion1; ls -lrt
total 0
-rw-r--r-- 1 root root 0 Jun 12 19:51 minion1

vagrant@minion2:~$ cd /mnt/; sudo touch minion2; ls -lrt
total 0
-rw-r--r-- 1 root root 0 Jun 12 19:51 minion1
-rw-r--r-- 1 root root 0 Jun 12 19:52 minion2
```
Note que quando executei o comando na maquina minion2, já foi exibido o arquivo criado na máquina minion1. Na máquina storage acessaremos o diretório montado anteriormente.

```
vagrant@storage:~$ cd /volumes/v1
vagrant@storage:/volumes/v1$ ls -lrtF
total 0
-rw-r--r-- 1 root root 0 Jun 12 19:51 minion1
-rw-r--r-- 1 root root 0 Jun 12 19:52 minion2
vagrant@storage:/volumes/v1$ 
```
Com este cluster montado, será possivel realizarem seus estudos no k8s e também realizar o desenvolvimento de aplicações.



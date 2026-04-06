# Basics

## Introduction to Containers

Containers are just Linux.

A container is really 3 things:
- chroot
- namespace
- cgroup

A `chroot` is an operation (from a command) that changes the apparent directory for the curent running process and its children.

A `namespace` is a ??? that wraps a globally-accessible resource (es. ?) with an abstraction that makes that resource appear local to a select processes that belong to the namespace.
There are several different types and namespaces and there can be many namespace instances.
You create a new namespace with the `clone` and `unshare` commands.

A `cgroup` (control group) is a feature of the Linux kernel that allows to manage, restrict and audit groups of processes.
It's used to limit the amount of resources allocated to a group of processes.## Quickstart

Make sure `docker` is installed:

`sudo pacman -S docker docker-compose`

Make sure the docker daemon is running:

`sudo systemctl enable --now docker.service`

## Introduction to Containers

Containers are just Linux.

A container is really 3 things:
- chroot
- namespace
- cgroup

A `chroot` is an operation (from a command) that changes the apparent directory for the curent running process and its children.

A `namespace` is a ??? that wraps a globally-accessible resource (es. ?) with an abstraction that makes that resource appear local to a select processes that belong to the namespace.
There are several different types and namespaces and there can be many namespace instances.
You create a new namespace with the `clone` and `unshare` commands.

A `cgroup` (control group) is a feature of the Linux kernel that allows to manage, restrict and audit groups of processes.
It's used to limit the amount of resources allocated to a group of processes.

## Local dev workflow

`sudo docker-compose up -d`

`sudo docker-compose stop`

`sudo docker-compose down`


## Update a container in production

1. Enter service directory: `cd ../services/service_name`
2. Stop containers: `sudo docker-compose stop`
3. Remove current containers: `sudo docker-compose down`
4. Get new images: `sudo docker-compose pull`
5. Restart containers: `sudo docker-compose up -d`

## Command Argument: exec

Enter the container's shell: `sudo docker exec -it container_name /bin/bash`

## Example

Repo: https://codeberg.org/simonrepp/feber

> Dockerfile

```
FROM archlinux:base

USER root

WORKDIR /opt/feber

RUN pacman -Syu --needed --noconfirm php
# Enable PHP module: intl
RUN touch /etc/php/conf.d/intl.ini && \
    echo 'extension=/usr/lib/php/modules/intl.so' > /etc/php/conf.d/intl.ini

RUN mkdir -vp /opt/feber

COPY ./src/index.php /opt/feber/index.php
COPY ./src/scripts.js /opt/feber/scripts.js
COPY ./src/styles.css /opt/feber/styles.css
COPY ./src/favicon.svg /opt/feber/favicon.svg
COPY ./src/splash.jpg /opt/feber/splash.jpg

EXPOSE 9090

CMD php --server 0.0.0.0:9090 --docroot /opt/feber
```

> docker-build.sh

```
#!/bin/bash
sudo docker build --tag simonrepp:feber-1.0.0 .
```

> docker-compose.yaml

```
services:
  feber:
    image: simonrepp:feber-1.0.0
    ports:
      - 9090:9090
    volumes:
      - ./src:/opt/feber
```

> start.sh

```
#!/bin/bash
docker-compose up -d
```



---
title: README - Docker image
author: FCACollin
---

This repository contains the docker image definition supporting the real
world evidence study of
_Neuromyelitis Optica Spectrum Disorder_ (NMOSD).
This image relies on the underlying docker image rocker/verse:4.1.0.


## TODOs

- add the `.pandoc/templates/eisvogel` file to user home dir.
- add default git config
[user]
	email = fca.collin@gmail.com
	name = Your Name
- dont remove install script:
  https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1008316
you should keep the script in the container for a future user to inspect; the script size is negligible compared to the image size

## Pre-requisite

- Installed [Docker](https://docs.docker.com/>)
  to build and run docker containerized applications.

## Quick Start

1. Build the container
    - run the command line:

```
docker build -t nmosd .
```

2. Run the container
    - Adapt (USER, PASSWORD and paths)
    - Run the command line:

```
docker run \
  --rm     \
  -p 8787:8787 \
  -e USER=fcollin \
  -e PASSWORD=fcollin \
  -v /home/fcollin/nmosd/:/home/fcollin/r-docker \
  nmosd
```

3. Remove the container (optional)
    - run the command line:

```
docker rmi rmi nmosd:latest
```

## Description

This image definition amends the docker image `rocker/verse:4.1.0` with
R package dependencies listed in the file `scripts/install_nmosd.sh`.

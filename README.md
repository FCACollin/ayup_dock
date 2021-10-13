---
title: README - Docker image
author: FCACollin
---

This repository contains the docker image definition for reproducibility
of statistical analysis.
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
docker build -t ayup_dock .
```

2. Run the container
    - Adapt (USER, PASSWORD and paths)
    - Run the command line:

```
docker run \
  --name rrms-covid \
  --restart always \
  --detach \
  --publish 8787:8787 \
  --env USER=$USER \
  --env PASSWORD=$USER \
  --volume /home/fcollin/Documents/praca/latarnia/P07_RRMS/p07_n04_covid:$HOME/r-docker \
  ayup_dock:v1.0.0
```

3. Update the image

```
docker container stop rrms-covid
docker rm rrms-covid
```

Then redo step 1 and 2.
## Description

This image definition amends the docker image `rocker/verse:4.1.0` with
R package dependencies listed in the file `scripts/install_nmosd.sh`.

---
title: README - Docker image
author: FCACollin
---

This repository contains the docker image definition for reproducibility
of statistical analysis.
This image relies on the underlying docker image rocker/verse:4.1.0.

This is not a magic image to tdo everything, it is expected to enclose all
dependencies identified during the performance of the contract.

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
docker build -t ayup_dock:v1.1.0 .
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
  --volume /home/fcollin/Documents/praca/latarnia/P07_RRMS:$HOME/r-docker \
  ayup_dock:v1.1.0
```

3. Update the image

```
docker container stop rrms-covid
docker rm rrms-covid
```

Then redo step 1 and 2.

## Further

Enter the terminal with: `docker exec -it rrms-covid bash`


## Description

This image definition amends the docker image `rocker/verse:4.1.0` with
R package dependencies listed in the file `scripts/install_nmosd.sh`.

## Change log


- v1.1.0:
    + addition of VennDiagram (r package).
    + addition of multcomp and multcompView (r package) for compact letter
      display.
- v1.0.3: addition of flextable (r package) and multirow texlice dependency
  along with ec.
- v1.0.2: added ggalluvial for alluvial plots.
- v1.0.1: added Rdpack for bibtex citations in r packages.
- v1.0.0 - minimal for my business.

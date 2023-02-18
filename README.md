### Anaconda docker image

#### Motivation:
There were some periodic problems with official (continuuumIO) docker images, that is why current repository was created.

#### Usage:

If you want to play with anaconda distribution you can use run.sh script,  
it allows to start jupiter notebook (or jupiter lab), current directory will be mounted automatically.  

If you need some additional packages, you can create child image ([example](https://github.com/yantonov/ml-docker)).

Build:
```bash
    run.sh build
```

Run jupiter notebook
```bash
    run.sh notebook
```

Run jupiter lab
```bash
    run.sh lab
    # or just
    run.sh
```

Docker file provides 
1. ubuntu 22.04
2. [anaconda](https://www.anaconda.com/products/individual) (check docker [file](https://github.com/yantonov/anaconda-docker/blob/master/python3/Dockerfile) to get anaconda version)

Links:
1. ContinuumIO [repository](https://github.com/ContinuumIO/docker-images) which contains docker images
2. ContinuumIO at [docker hub](https://hub.docker.com/u/continuumio/)
3. Anaconda [archive](https://repo.anaconda.com/archive/)

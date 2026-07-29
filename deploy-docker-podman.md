



```bash
git clone https://github.com/ebasso/ibm-bob-shell-container.git

cd ibm-bob-shell-container/docker
```

```bash
export DOCKER_LOGIN=docker.io
export DOCKER_REPO=docker.io/ebasso
export DOCKER_USER=<your email>
export DOCKER_PWD=<your password>

podman login $DOCKER_LOGIN -u $DOCKER_USER -p $DOCKER_PWD
```

```bash
podman build  -f Dockerfile -t $DOCKER_REPO/bob-shell:1.0.6

```

```bash
podman push $DOCKER_REPO//bob-shell:1.0.6
```
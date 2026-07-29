## Build and Push with Docker or Podman

### 1. Clone the repository and go to the Docker directory

```bash
git clone https://github.com/ebasso/ibm-bob-shell-container.git
cd ibm-bob-shell-container/docker
```

### 2. Set the container registry variables

```bash
export DOCKER_LOGIN=docker.io
export DOCKER_REPO=docker.io/ebasso
export DOCKER_USER=<your email>
export DOCKER_PWD=<your password>
```

### 3. Log in to the registry

```bash
podman login $DOCKER_LOGIN -u $DOCKER_USER -p $DOCKER_PWD
```

### 4. Build the image

```bash
podman build -f Dockerfile -t $DOCKER_REPO/bob-shell:1.0.6
```

### 5. Push the image

```bash
podman push $DOCKER_REPO//bob-shell:1.0.6
```

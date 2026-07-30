## File Structure

```text
openshift-bob
├── Dockerfile
├── serviceaccount.yaml
├── role.yaml
├── rolebinding.yaml
├── pvc.yaml
├── deployment.yaml
└── secret-bob-credentials.yaml
```

## Deploy on OpenShift

### 1. Create a new project

```bash
oc new-project bob-shell
```

### 2. Apply the manifests

```bash
oc apply -f secrets.yaml
oc apply -f serviceaccount.yaml
oc apply -f role.yaml
oc apply -f rolebinding.yaml
oc apply -f pvc.yaml
```

### 3. Build and push the container image

Before deploying, you need to build the container image and push it to a registry accessible by your OpenShift cluster. Follow the instructions in `deploy-docker-podman.md` to build the image.

After building, tag and push the image to your registry:

```bash
# Example: Push to OpenShift internal registry
docker tag bob-shell:latest <your-registry>/bob-shell/bob-shell:latest
docker push <your-registry>/bob-shell/bob-shell:latest
```

Update the `image` field in `deployment.yaml` to point to your pushed image.

### 4. Deploy the application

```bash
oc apply -f deployment.yaml
```

## Using Bob Shell in the OpenShift CLI

### How to get the API token

1. Go to `https://bob.ibm.com`
2. Sign in with your IBM credentials
3. Navigate to **Settings/Profile > API Tokens**
4. Generate a new token
5. Copy it and use it in the command above

### Access the container

```bash
# Get the pod name
POD_NAME=$(oc get pods -l app=bob-shell -o jsonpath='{.items[0].metadata.name}')

# Access the container shell
oc exec -it $POD_NAME -- /bin/bash
```

### Inside the container

Once inside the container, you have full access to Bob Shell (authenticated with `bob.ibm.com`) and the OpenShift CLI:

```bash
# Verify Bob Shell authentication
bob whoami
bob --version

# Use Bob Shell for development tasks
bob ask "How can I list all pods with issues?"
bob code "Create a script to check the status of all deployments"
```

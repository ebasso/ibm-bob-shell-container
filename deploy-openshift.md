
5
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

### 1. Create a new porject

```bash
oc new-project bob-shell
```

### 2. Apply manifests

```bash
oc apply -f secrets.yaml
oc apply -f serviceaccount.yaml
oc apply -f role.yaml
oc apply -f rolebinding.yaml
oc apply -f pvc.yaml
oc apply -f deployment.yaml
```

## Using Bob Shell in OpenShift CLI

**Como obter o Token de API:**
1. Acesse https://bob.ibm.com
2. Faça login com suas credenciais IBM
3. Vá em Settings/Profile > API Tokens
4. Gere um novo token
5. Copie e use no comando acima

### Acessar o Container

```bash
# Obter o nome do pod
POD_NAME=$(oc get pods -l app=bob-shell -o jsonpath='{.items[0].metadata.name}')

# Acessar o shell do container
oc exec -it $POD_NAME -- /bin/bash
```

### Dentro do Container

Uma vez dentro do container, você tem acesso completo ao Bob Shell (autenticado com bob.ibm.com) e ao CLI do OpenShift:

```bash
# Verificar autenticação do Bob Shell
bob whoami
bob --version

# Usar Bob Shell para tarefas de desenvolvimento
bob ask "Como posso listar todos os pods com problemas?"
bob code "Crie um script para verificar o status de todos os deployments"
```


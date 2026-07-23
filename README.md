# Bob Shell no OpenShift

Este diretório contém os arquivos YAML necessários para executar o Bob Shell em um cluster OpenShift com CLI `oc` integrado e autenticação no bob.ibm.com.

## Arquivos Incluídos

- **Dockerfile**: Imagem Docker base com Bob Shell e OpenShift CLI instalados
- **imagestream.yaml**: ImageStream para gerenciar a imagem do container
- **buildconfig.yaml**: BuildConfig para construir a imagem no OpenShift
- **serviceaccount.yaml**: ServiceAccount para o pod do Bob Shell
- **role.yaml**: Role com permissões amplas para gerenciar recursos
- **rolebinding.yaml**: RoleBinding associando a Role ao ServiceAccount
- **pvc.yaml**: PersistentVolumeClaim para armazenar o workspace
- **deployment.yaml**: Deployment do Bob Shell com variáveis de ambiente para credenciais
- **secret-bob-credentials.yaml**: Template para Secret com credenciais do bob.ibm.com
- **configure-bob-credentials.sh**: Script interativo para configurar credenciais

## Características Principais

✅ **OpenShift CLI (oc) integrado** - Comandos oc disponíveis dentro do container
✅ **kubectl também disponível** - Compatibilidade com Kubernetes nativo
✅ **ServiceAccount Token automático** - Autenticação automática com o cluster OpenShift
✅ **Autenticação Bob Shell** - Credenciais seguras via Kubernetes Secret
✅ **Permissões RBAC configuradas** - Acesso a pods, deployments, routes, builds, etc.
✅ **Workspace persistente** - 10Gi de armazenamento para projetos
✅ **Segurança reforçada** - Container não-root, capabilities restritas

## Pré-requisitos

- Acesso a um cluster OpenShift
- CLI `oc` instalado e configurado localmente
- Permissões para criar recursos no namespace
- Conta no Bob Shell (bob.ibm.com) com token de API ou credenciais

## Deploy no OpenShift

### 1. Criar um novo projeto (opcional)

```bash
oc new-project bob-shell
```

### 2. Configurar credenciais do Bob Shell

**Opção A: Usar o script interativo (Recomendado)**

```bash
./configure-bob-credentials.sh
```

O script irá guiá-lo através do processo de configuração, permitindo escolher entre:
- Token de API (recomendado)
- Usuário e senha

**Opção B: Criar o Secret manualmente**

```bash
# Com Token de API
oc create secret generic bob-credentials \
  --from-literal=BOB_API_TOKEN="seu-token-aqui" \
  --from-literal=BOB_API_URL="https://bob.ibm.com/api"

# OU com Usuário/Senha
oc create secret generic bob-credentials \
  --from-literal=BOB_USERNAME="seu-usuario@ibm.com" \
  --from-literal=BOB_PASSWORD="sua-senha" \
  --from-literal=BOB_API_URL="https://bob.ibm.com/api"
```

**Como obter o Token de API:**
1. Acesse https://bob.ibm.com
2. Faça login com suas credenciais IBM
3. Vá em Settings/Profile > API Tokens
4. Gere um novo token
5. Copie e use no comando acima

### 3. Aplicar os recursos do OpenShift

```bash
# Criar ServiceAccount
oc apply -f serviceaccount.yaml

# Criar Role e RoleBinding
oc apply -f role.yaml
oc apply -f rolebinding.yaml

# Criar PersistentVolumeClaim
oc apply -f pvc.yaml

# Criar ImageStream
oc apply -f imagestream.yaml

# Criar BuildConfig e iniciar o build
oc apply -f buildconfig.yaml
oc start-build bob-shell

# Aguardar o build completar (pode levar alguns minutos)
oc logs -f bc/bob-shell

# Criar Deployment (já configurado para usar o Secret)
oc apply -f deployment.yaml
```

### 4. Verificar o status

```bash
# Verificar o build
oc get builds

# Verificar o deployment
oc get deployment bob-shell

# Verificar os pods
oc get pods -l app=bob-shell

# Aguardar o pod estar pronto
oc wait --for=condition=ready pod -l app=bob-shell --timeout=300s
```

## Usando Bob Shell com OpenShift CLI

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

# Verificar versão do oc
oc version

# Verificar contexto atual do OpenShift (já autenticado via ServiceAccount)
oc whoami
oc project

# Listar recursos do namespace
oc get pods
oc get deployments
oc get routes

# Usar Bob Shell para tarefas de desenvolvimento
bob ask "Como posso listar todos os pods com problemas?"
bob code "Crie um script para verificar o status de todos os deployments"
```

### Exemplos de Uso Integrado

#### Exemplo 1: Análise de Logs com Bob

```bash
# Dentro do container
bob ask "Analise os logs do pod nginx-xxx e identifique erros"

# Bob pode executar comandos oc internamente
# Exemplo: oc logs nginx-xxx | grep ERROR
```

#### Exemplo 2: Debugging de Aplicações

```bash
bob code "Crie um script que:
1. Liste todos os pods com status CrashLoopBackOff
2. Colete os logs dos últimos 100 linhas
3. Salve em arquivos separados no /workspace"
```

#### Exemplo 3: Automação de Tarefas

```bash
bob code "Crie um script bash que:
1. Verifica o status de todos os deployments
2. Escala para 0 réplicas os que estão com erro
3. Gera um relatório em markdown"
```

#### Exemplo 4: Geração de Manifestos

```bash
bob code "Gere um Deployment YAML para uma aplicação Node.js com:
- 3 réplicas
- Health checks configurados
- Resource limits apropriados
- Service e Route do OpenShift"
```

## Gerenciamento de Credenciais

### Atualizar Credenciais

```bash
# Deletar o Secret existente
oc delete secret bob-credentials

# Recriar com novas credenciais
./configure-bob-credentials.sh

# Reiniciar o deployment para aplicar as novas credenciais
oc rollout restart deployment/bob-shell
```

### Verificar Credenciais

```bash
# Ver o Secret (valores codificados em base64)
oc get secret bob-credentials -o yaml

# Decodificar um valor específico
oc get secret bob-credentials -o jsonpath='{.data.BOB_API_TOKEN}' | base64 -d
```

### Rotação de Token

É recomendado rotacionar o token de API periodicamente:

```bash
# 1. Gere um novo token em https://bob.ibm.com
# 2. Atualize o Secret
oc create secret generic bob-credentials \
  --from-literal=BOB_API_TOKEN="novo-token-aqui" \
  --from-literal=BOB_API_URL="https://bob.ibm.com/api" \
  --dry-run=client -o yaml | oc apply -f -

# 3. Reinicie o deployment
oc rollout restart deployment/bob-shell
```

## Permissões Configuradas

### Permissões do OpenShift (via ServiceAccount)

O ServiceAccount `bob-shell` tem as seguintes permissões no namespace:

- **Pods**: get, list, watch, create, update, patch, delete, exec, logs
- **Deployments/StatefulSets/DaemonSets**: get, list, watch, create, update, patch, delete
- **Services/ConfigMaps/Secrets**: get, list, watch, create, update, patch, delete
- **Jobs/CronJobs**: get, list, watch, create, update, patch, delete
- **Routes (OpenShift)**: get, list, watch, create, update, patch, delete
- **Builds/BuildConfigs**: get, list, watch
- **ImageStreams**: get, list, watch

### Permissões do Bob Shell (via bob.ibm.com)

As permissões do Bob Shell dependem da sua conta em bob.ibm.com e do token/credenciais fornecidas.

## Personalização

### Alterar o StorageClass

Edite o arquivo `pvc.yaml`:

```yaml
spec:
  storageClassName: seu-storage-class
```

### Ajustar recursos

Edite o arquivo `deployment.yaml`:

```yaml
resources:
  requests:
    memory: "1Gi"
    cpu: "500m"
  limits:
    memory: "4Gi"
    cpu: "2000m"
```

### Adicionar permissões extras no OpenShift

Edite o arquivo `role.yaml`:

```yaml
rules:
  - apiGroups: ["apps.openshift.io"]
    resources: ["deploymentconfigs"]
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
```

### Usar em múltiplos namespaces

Para dar permissões em múltiplos namespaces, crie um ClusterRole e ClusterRoleBinding:

```bash
# Converter Role para ClusterRole
sed 's/kind: Role/kind: ClusterRole/' role.yaml > clusterrole.yaml
oc apply -f clusterrole.yaml

# Criar ClusterRoleBinding
cat <<EOF | oc apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: bob-shell-cluster-binding
subjects:
  - kind: ServiceAccount
    name: bob-shell
    namespace: $(oc project -q)
roleRef:
  kind: ClusterRole
  name: bob-shell-role
  apiGroup: rbac.authorization.k8s.io
EOF
```

## Troubleshooting

### Build falhou

```bash
# Ver logs do build
oc logs -f bc/bob-shell

# Verificar eventos
oc get events --sort-by='.lastTimestamp'

# Recriar o build
oc delete bc bob-shell
oc apply -f buildconfig.yaml
oc start-build bob-shell
```

### Pod não inicia

```bash
# Ver eventos do pod
oc describe pod $POD_NAME

# Ver logs do pod
oc logs $POD_NAME

# Verificar se a imagem foi criada
oc get is bob-shell

# Verificar se o Secret existe
oc get secret bob-credentials
```

### Bob Shell não está autenticado

```bash
# Verificar se o Secret existe
oc get secret bob-credentials

# Verificar se as variáveis de ambiente estão configuradas no pod
oc exec -it $POD_NAME -- env | grep BOB

# Testar autenticação dentro do container
oc exec -it $POD_NAME -- bob whoami

# Se falhar, verifique as credenciais e recrie o Secret
oc delete secret bob-credentials
./configure-bob-credentials.sh
oc rollout restart deployment/bob-shell
```

### Problemas de permissão com oc

```bash
# Verificar ServiceAccount
oc get sa bob-shell

# Verificar RoleBinding
oc describe rolebinding bob-shell-rolebinding

# Verificar Role
oc describe role bob-shell-role

# Testar permissões dentro do container
oc exec -it $POD_NAME -- oc auth can-i get pods
oc exec -it $POD_NAME -- oc auth can-i create deployments
```

### oc não encontrado no container

```bash
# Verificar se o build incluiu o oc
oc exec -it $POD_NAME -- which oc

# Verificar versão
oc exec -it $POD_NAME -- oc version

# Se não estiver disponível, reconstrua a imagem
oc start-build bob-shell
```

## Casos de Uso

### 1. Desenvolvimento Assistido por IA

Use Bob Shell para gerar código, scripts e configurações Kubernetes/OpenShift:

```bash
bob code "Crie um Deployment para nginx com 3 réplicas e um Service"
bob code "Gere um script de backup para todos os ConfigMaps"
bob ask "Como posso implementar blue-green deployment no OpenShift?"
```

### 2. Análise e Debugging

```bash
bob ask "Por que meu pod está em CrashLoopBackOff?"
bob ask "Como posso otimizar o uso de recursos deste deployment?"
bob code "Analise os logs de todos os pods com erro e gere um relatório"
```

### 3. Automação de Tarefas

```bash
bob code "Crie um script que monitora pods e reinicia os que estão com erro"
bob code "Gere um script de health check para todos os deployments"
bob code "Automatize o processo de rollback de deployments com falha"
```

### 4. Documentação Automática

```bash
bob ask "Documente a arquitetura desta aplicação baseado nos recursos do namespace"
bob code "Crie um diagrama mermaid da topologia de rede"
bob code "Gere documentação markdown de todos os ConfigMaps e Secrets"
```

### 5. Migração e Transformação

```bash
bob code "Converta estes manifestos Kubernetes para OpenShift"
bob code "Gere Helm charts a partir dos recursos existentes"
bob ask "Como posso migrar esta aplicação para usar Operators?"
```

## Segurança

### Boas Práticas

1. **Use Token de API** em vez de usuário/senha quando possível
2. **Rotacione tokens** regularmente (recomendado: a cada 90 dias)
3. **Limite permissões** do Role apenas ao necessário para seu caso de uso
4. **Não compartilhe** o Secret entre namespaces desnecessariamente
5. **Monitore** o uso do ServiceAccount e do Bob Shell

### Auditoria

```bash
# Ver quem está usando o ServiceAccount
oc get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.serviceAccountName}{"\n"}{end}'

# Ver logs de acesso (se auditoria estiver habilitada)
oc adm top pods -l app=bob-shell
```

### Notas de Segurança

- ✅ Container executa como usuário não-root (UID 1001)
- ✅ Security Context Constraints (SCC) restritivos aplicados
- ✅ Capabilities desnecessárias removidas
- ✅ Seccomp profile aplicado
- ✅ Privilege escalation desabilitado
- ✅ ServiceAccount token montado automaticamente para autenticação OpenShift
- ✅ Credenciais Bob Shell armazenadas em Kubernetes Secret
- ⚠️ Permissões amplas no namespace - ajuste conforme necessário para produção
- ⚠️ Secret não é criptografado em repouso por padrão - considere usar sealed-secrets ou vault

## Limpeza

Para remover todos os recursos:

```bash
oc delete deployment bob-shell
oc delete pvc bob-workspace-pvc
oc delete bc bob-shell
oc delete is bob-shell
oc delete rolebinding bob-shell-rolebinding
oc delete role bob-shell-role
oc delete sa bob-shell
oc delete secret bob-credentials
```

Ou remover o projeto inteiro:

```bash
oc delete project bob-shell
```

## Suporte

Para mais informações:
- **Bob Shell**: https://bob.ibm.com/docs
- **OpenShift CLI**: https://docs.openshift.com/container-platform/latest/cli_reference/openshift_cli/getting-started-cli.html
- **Kubernetes Secrets**: https://kubernetes.io/docs/concepts/configuration/secret/

## FAQ

**P: Posso usar o mesmo container para múltiplos usuários?**
R: Não é recomendado. Cada usuário deve ter seu próprio deployment com suas próprias credenciais.

**P: Como posso usar Bob Shell fora do container?**
R: Bob Shell pode ser instalado localmente. Este setup é específico para uso em OpenShift.

**P: As credenciais são seguras?**
R: Sim, elas são armazenadas em um Kubernetes Secret. Para maior segurança, considere usar sealed-secrets ou HashiCorp Vault.

**P: Posso usar este setup em produção?**
R: Sim, mas revise e ajuste as permissões do Role conforme suas necessidades de segurança.

**P: Como posso adicionar mais ferramentas ao container?**
R: Edite o Dockerfile e adicione as ferramentas necessárias, depois reconstrua a imagem.

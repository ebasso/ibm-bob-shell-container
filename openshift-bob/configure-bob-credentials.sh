#!/bin/bash

# Script para configurar credenciais do Bob Shell (bob.ibm.com) no OpenShift
# Este script cria o Secret com as credenciais necessárias

set -e

echo "=========================================="
echo "Configuração de Credenciais Bob Shell"
echo "=========================================="
echo ""

# Verificar se oc está instalado
if ! command -v oc &> /dev/null; then
    echo "❌ Erro: CLI 'oc' não encontrado. Instale o OpenShift CLI primeiro."
    exit 1
fi

# Verificar se está logado no cluster
if ! oc whoami &> /dev/null; then
    echo "❌ Erro: Você não está logado no cluster OpenShift."
    echo "Execute: oc login <cluster-url>"
    exit 1
fi

echo "✅ Conectado ao cluster OpenShift como: $(oc whoami)"
echo "✅ Projeto atual: $(oc project -q)"
echo ""

# Perguntar qual método de autenticação usar
echo "Escolha o método de autenticação:"
echo "1) Token de API (Recomendado)"
echo "2) Usuário e Senha"
echo ""
read -p "Opção [1-2]: " auth_method

case $auth_method in
    1)
        echo ""
        echo "📝 Para obter seu token de API:"
        echo "   1. Acesse https://bob.ibm.com"
        echo "   2. Faça login com suas credenciais IBM"
        echo "   3. Vá em Settings/Profile > API Tokens"
        echo "   4. Gere um novo token"
        echo ""
        read -sp "Cole seu Token de API: " api_token
        echo ""
        
        if [ -z "$api_token" ]; then
            echo "❌ Token não pode estar vazio!"
            exit 1
        fi
        
        # Criar Secret com token
        oc create secret generic bob-credentials \
            --from-literal=BOB_API_TOKEN="$api_token" \
            --from-literal=BOB_API_URL="https://bob.ibm.com/api" \
            --dry-run=client -o yaml | oc apply -f -
        
        echo "✅ Secret 'bob-credentials' criado com sucesso usando Token de API!"
        ;;
        
    2)
        echo ""
        read -p "Usuário (email IBM): " username
        read -sp "Senha: " password
        echo ""
        
        if [ -z "$username" ] || [ -z "$password" ]; then
            echo "❌ Usuário e senha não podem estar vazios!"
            exit 1
        fi
        
        # Criar Secret com usuário e senha
        oc create secret generic bob-credentials \
            --from-literal=BOB_USERNAME="$username" \
            --from-literal=BOB_PASSWORD="$password" \
            --from-literal=BOB_API_URL="https://bob.ibm.com/api" \
            --dry-run=client -o yaml | oc apply -f -
        
        echo "✅ Secret 'bob-credentials' criado com sucesso usando Usuário/Senha!"
        ;;
        
    *)
        echo "❌ Opção inválida!"
        exit 1
        ;;
esac

echo ""
echo "=========================================="
echo "Configuração concluída!"
echo "=========================================="
echo ""
echo "Próximos passos:"
echo "1. Aplique o deployment atualizado:"
echo "   oc apply -f deployment.yaml"
echo ""
echo "2. Aguarde o pod reiniciar:"
echo "   oc rollout status deployment/bob-shell"
echo ""
echo "3. Acesse o container:"
echo "   POD_NAME=\$(oc get pods -l app=bob-shell -o jsonpath='{.items[0].metadata.name}')"
echo "   oc exec -it \$POD_NAME -- /bin/bash"
echo ""
echo "4. Dentro do container, verifique se Bob Shell está autenticado:"
echo "   bob whoami"
echo "   bob --version"
echo ""

FROM node:22.15-alpine

# Instalar dependências do sistema
RUN apk add --no-cache \
    bash \
    git \
    curl \
    ca-certificates \
    openssh-client \
    python3 \
    make \
    g++ \
    ripgrep \
    tar \
    gzip

# Instalar OpenShift CLI (oc)
RUN curl -L https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz -o /tmp/oc.tar.gz && \
    tar -xzf /tmp/oc.tar.gz -C /usr/local/bin/ oc kubectl && \
    rm -f /tmp/oc.tar.gz && \
    chmod +x /usr/local/bin/oc /usr/local/bin/kubectl

# Criar usuário não-root
RUN addgroup -g 1001 bobuser && \
    adduser -D -u 1001 -G bobuser bobuser

# Criar diretórios necessários
RUN mkdir -p /home/bobuser/.bob /workspace /home/bobuser/.kube && \
    chown -R bobuser:bobuser /home/bobuser /workspace

# Definir usuário
USER bobuser
WORKDIR /workspace

# Instalar Bob Shell com debug habilitado
# Baixar o script primeiro para análise
RUN curl -fsSL https://bob.ibm.com/download/bobshell.sh -o /tmp/bobshell.sh && \
    chmod +x /tmp/bobshell.sh && \
    echo "=== Starting Bob Shell installation with debug ===" && \
    bash -x /tmp/bobshell.sh --pm npm 2>&1 | tee /tmp/bobshell-install-debug.log && \
    echo "=== Installation completed ===" && \
    rm -f /tmp/bobshell.sh

# Verificar se bob foi instalado
RUN which bob && bob --version || (echo "ERROR: bob not found after installation" && cat /tmp/bobshell-install-debug.log && exit 1)

# Expor porta se necessário (para servidor web futuro)
EXPOSE 3000

# Comando padrão
CMD ["bob", "--help"]
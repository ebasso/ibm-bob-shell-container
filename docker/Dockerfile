# Use Node.js 22.15 Alpine for a smaller image
FROM node:26.1-alpine

ENV HOME=/app
ENV SSO_PORT=10000

# Set working directory
WORKDIR /app

# Install curl and bash (required for Bob Shell installation)
RUN apk add --no-cache curl bash tar gzip haproxy

RUN curl -L https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz -o /tmp/oc.tar.gz && \
    tar -xzf /tmp/oc.tar.gz -C /usr/local/bin/ oc kubectl && \
    rm -f /tmp/oc.tar.gz && \
    chmod +x /usr/local/bin/oc /usr/local/bin/kubectl

# Install Bob Shell
# The script is interactive, so we need to pipe yes to auto-accept prompts
RUN curl -fsSL https://bob.ibm.com/download/bobshell.sh | bash -s -- --package-manager npm

RUN mkdir -p /app/.bob/settings && chown -R 1001:0 /app && chmod -R a+rwX /app

# Add npm global bin to PATH for the bob command
ENV PATH="/root/.npm-global/bin:${PATH}"

# Create a non-root user for security
RUN addgroup -g 1001 bobuser && \
    adduser -D -u 1001 -G bobuser bobuser

# Switch to non-root user
USER bobuser

EXPOSE 10000

# Set the entrypoint to bob
ENTRYPOINT ["bob"]

# Default command (can be overridden)
CMD ["--help"]
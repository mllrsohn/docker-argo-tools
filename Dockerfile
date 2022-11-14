ARG ARGO_USER=999
ARG ARGO_VERSION=v2.5.2
FROM quay.io/argoproj/argocd:$ARGO_VERSION

# Switch to root for the ability to perform install
USER root

# Install tools needed for your repo-server to retrieve & decrypt secrets, render manifests
# (e.g. curl, awscli, gpg, sops)
RUN apt-get update && \
    apt-get install -y \
        git-crypt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Stay on root to debug repo issues
USER $ARGO_USER

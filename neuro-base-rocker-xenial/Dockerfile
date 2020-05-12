ARG BASE_IMAGE=rstudio/r-base
FROM ${BASE_IMAGE}:xenial

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/adigherman/docker/tree/master/neuro-base-rocker-xenial" \
      org.label-schema.vendor="Neuroconductor Rocker Xenial Base Image" \
      maintainer="Adi Gherman <adig@jhu.edu>"

ARG R_VERSION=4.0.0
ARG OS_IDENTIFIER=ubuntu-1604

# Install R
RUN wget https://cdn.rstudio.com/r/${OS_IDENTIFIER}/pkgs/r-${R_VERSION}_1_amd64.deb && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -f -y ./r-${R_VERSION}_1_amd64.deb && \
    ln -s /opt/R/${R_VERSION}/bin/R /usr/bin/R && \
    ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/bin/Rscript && \
    ln -s /opt/R/${R_VERSION}/lib/R /usr/lib/R && \
    rm r-${R_VERSION}_1_amd64.deb && \
    rm -rf /var/lib/apt/lists/*
FROM ubuntu:xenial

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/adigherman/docker/tree/master/neuro-base-xenial" \
      org.label-schema.vendor="Neuroconductor Xenial Base Image" \
      maintainer="Adi Gherman <adig@jhu.edu>"

# https://bugs.debian.org/830696 (apt uses gpgv by default in newer releases, rather than gpg) 
RUN set -x \
	&& apt-get update \
	&& { \
		which gpg \
		|| apt-get install -y --no-install-recommends gnupg \
	; } \
# Ubuntu includes "gnupg" (not "gnupg2", but still 2.x), but not dirmngr, and gnupg 2.x requires dirmngr
# so, if we're not running gnupg 1.x, explicitly install dirmngr too
	&& { \
		gpg --version | grep -q '^gpg (GnuPG) 1\.' \
		|| apt-get install -y --no-install-recommends dirmngr \
	; } \
	&& rm -rf /var/lib/apt/lists/*

# apt-key is a bit finicky during "docker build" with gnupg 2.x, so install the repo key the same way debian-archive-keyring does (/etc/apt/trusted.gpg.d)
# this makes "apt-key list" output prettier too!
RUN set -x \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys DD95CC430502E37EF840ACEEA5D32F012649A5A9 \
	&& gpg --batch --export DD95CC430502E37EF840ACEEA5D32F012649A5A9 > /etc/apt/trusted.gpg.d/neurodebian.gpg \
	&& rm -rf "$GNUPGHOME" \
	&& apt-key list | grep neurodebian


RUN { \
	echo 'deb http://neuro.debian.net/debian xenial main'; \
	echo 'deb http://neuro.debian.net/debian data main'; \
	echo '#deb-src http://neuro.debian.net/debian-devel xenial main'; \
} > /etc/apt/sources.list.d/neurodebian.sources.list

# Minimalistic package to assist with freezing the APT configuration
# which would be coming from neurodebian repo.
# Also install and enable eatmydata to be used for all apt-get calls
# to speed up docker builds.
RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends neurodebian-freeze eatmydata \
	&& ln -s /usr/bin/eatmydata /usr/local/bin/apt-get \
	&& rm -rf /var/lib/apt/lists/*
	
RUN apt-get update && apt-get install -y wget jq vim && apt-get install -y ca-certificates && apt-get install -y apt-transport-https

ENV R_VERSION_MAJOR=4
ENV R_VERSION_MINOR=0
ENV R_VERSION_PATCH=0
ENV CONFIGURE_OPTIONS="--with-cairo --with-jpeglib --enable-R-shlib --with-blas --with-lapack"
ENV RENV_VERSION 0.9.3

RUN wget -O- http://neuro.debian.net/lists/xenial.us-tn.full | tee /etc/apt/sources.list.d/neurodebian.sources.list
RUN apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0x4E2C6E8793298290

RUN apt-get update

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils\
    gfortran \
    git \
    g++ \
    libreadline-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \   
    libssl-dev \ 
    libxml2-dev \
    libudunits2-dev \
    libgdal-dev \
    libbz2-dev \
    libzstd-dev \
    liblzma-dev \
    libpcre2-dev \
    locales \
    screen \
    texinfo \
    texlive \
    texlive-fonts-extra \
    vim \
    wget \
    xvfb \
    tcl8.6-dev \
    tk8.6-dev \
    cmake \
    curl \
    python3-dev \
    python3-setuptools \
    unzip \
    libcurl4-gnutls-dev \
    python-pip \
    python-virtualenv \
    libgsl-dev \
    libcgal-dev \
    libglu1-mesa-dev \
    libglu1-mesa-dev \
    libtiff5-dev \
&& rm -rf /var/lib/apt/lists/*

# xenial installs cmake 3.5.1. We need a newer version (3.17).
#
# NOTE: When upgrading cmake, bump the rebuild counters in
# c-deps/*-rebuild to force recreating the makefiles. This prevents
# strange build errors caused by those makefiles depending on the
# installed version of cmake.
RUN curl -fsSL https://github.com/Kitware/CMake/releases/download/v3.17.0/cmake-3.17.0-Linux-x86_64.tar.gz -o cmake.tar.gz \
 && echo 'b44685227b9f9be103e305efa2075a8ccf2415807fbcf1fc192da4d36aacc9f5 cmake.tar.gz' | sha256sum -c - \
 && tar --strip-components=1 -C /usr -xzf cmake.tar.gz \
 && rm cmake.tar.gz
 
# git - Upgrade to a more modern version
RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common && \
    add-apt-repository ppa:git-core/ppa -y && \
    apt-get update && \
    apt-get install -y git

## Install R
RUN wget https://cran.rstudio.com/src/base/R-${R_VERSION_MAJOR}/R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz && \
    tar zxvf R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz && \
    rm R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz

WORKDIR /R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}

RUN ./configure ${CONFIGURE_OPTIONS} && \ 
    make && \
    make install

RUN apt-get update

## Install afni, fsl (and dependencies)
RUN apt-get install -y \
	libgsl2 \
	afni \
	fsl-complete
	
ENV FSLDIR=/usr/local/fsl
ENV FSLSHARE=/usr/share/data
ENV PATH=$PATH:${FSLDIR}/bin

RUN mkdir -p ${FSLDIR}/bin  \
&& cp /usr/lib/fsl/5.0/* ${FSLDIR}/bin/

RUN mkdir -p ${FSLDIR}/data/standard \
&& mkdir -p ${FSLDIR}/data/atlases 

RUN cp -R ${FSLSHARE}/fsl-mni152-templates/* ${FSLDIR}/data/standard/

# setting up atlases
RUN \
cp -R ${FSLSHARE}/harvard-oxford-atlases/* ${FSLDIR}/data/atlases/ \
&& cp -R ${FSLSHARE}/juelich-histological-atlas/* ${FSLDIR}/data/atlases/ \
&& cp -R ${FSLSHARE}/bangor-cerebellar-atlas/* ${FSLDIR}/data/atlases/ \
&& cp -R ${FSLSHARE}/jhu-dti-whitematter-atlas/* ${FSLDIR}/data/atlases/ \
&& cp -R ${FSLSHARE}/forstmann-subthalamic-nucleus-atlas/* ${FSLDIR}/data/atlases/ \
&& cp -R ${FSLSHARE}/fsl-resting-connectivity-parcellation-atlases/* ${FSLDIR}/data/atlases/ \
&& cp -R ${FSLSHARE}/mni-structural-atlas/* ${FSLDIR}/data/atlases/ \
&& cp -R ${FSLSHARE}/oxford-thalamic-connectivity-atlas/* ${FSLDIR}/data/atlases/ \
&& cp -R ${FSLSHARE}/talairach-daemon-atlas/* ${FSLDIR}/data/atlases/ 


ENV FSLOUTPUTTYPE=NIFTI_GZ

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/fsl/5.0

## Install OpenCV
WORKDIR /
ENV OPENCV_VERSION="4.3.0"
RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
&& unzip ${OPENCV_VERSION}.zip \
&& mkdir /opencv-${OPENCV_VERSION}/cmake_binary \
&& cd /opencv-${OPENCV_VERSION}/cmake_binary \
&& cmake -DBUILD_TIFF=ON \
  -DBUILD_opencv_java=OFF \
  -DWITH_CUDA=OFF \
  -DWITH_OPENGL=ON \
  -DWITH_OPENCL=ON \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DWITH_EIGEN=ON \
  -DWITH_V4L=ON \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DCMAKE_BUILD_TYPE=RELEASE \
  -DCMAKE_INSTALL_PREFIX=$(python3.5 -c "import sys; print(sys.prefix)") \
  -DPYTHON_EXECUTABLE=$(which python3.5) \
  -DPYTHON_INCLUDE_DIR=$(python3.5 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -DPYTHON_PACKAGES_PATH=$(python3.5 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
  .. \
&& make install \
&& rm /${OPENCV_VERSION}.zip \
&& rm -r /opencv-${OPENCV_VERSION}

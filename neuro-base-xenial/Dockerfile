FROM adigherman/neurodocker:xenial

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/adigherman/docker/tree/master/neuro-base-xenial" \
      org.label-schema.vendor="Neuroconductor Xenial Base Image" \
      maintainer="Adi Gherman <adig@jhu.edu>"

ENV R_VERSION_MAJOR=4
ENV R_VERSION_MINOR=0
ENV R_VERSION_PATCH=0
ENV CONFIGURE_OPTIONS="--with-cairo --with-jpeglib --enable-R-shlib --with-blas --with-lapack"
ENV RENV_VERSION 0.9.3

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
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*\
# xenial installs cmake 3.5.1. We need a newer version (3.17).
#
# NOTE: When upgrading cmake, bump the rebuild counters in
# c-deps/*-rebuild to force recreating the makefiles. This prevents
# strange build errors caused by those makefiles depending on the
# installed version of cmake.
    && curl -fsSL https://github.com/Kitware/CMake/releases/download/v3.17.0/cmake-3.17.0-Linux-x86_64.tar.gz -o cmake.tar.gz \
    && echo 'b44685227b9f9be103e305efa2075a8ccf2415807fbcf1fc192da4d36aacc9f5 cmake.tar.gz' | sha256sum -c - \
    && tar --strip-components=1 -C /usr -xzf cmake.tar.gz \
    && rm cmake.tar.gz \
# git - Upgrade to a more modern version
    && add-apt-repository ppa:git-core/ppa -y \
    && apt-get update \
    && apt-get install -y git \
    && wget https://cran.rstudio.com/src/base/R-${R_VERSION_MAJOR}/R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz \
    && tar zxvf R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz \
    && rm R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz \
    && cd /R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH} \
    && ./configure ${CONFIGURE_OPTIONS} \ 
    && make \
    && make install

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

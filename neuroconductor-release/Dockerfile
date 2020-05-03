FROM adigherman/neuro-base-xenial

## Set default CRAN repo
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /usr/local/lib/R/etc/Rprofile.site

## Install Neuroconductor Packages
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("gifti")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.base")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("waveslim")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ROpenCVLite")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("RNifti")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.asl")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.det2")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.t1")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.t2")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.flair")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.fmri")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.mricloud")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.vaso")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.mt")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("nitrcbot")'
FROM adigherman/neuro-base-xenial

## Set default CRAN repo
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /usr/local/lib/R/etc/Rprofile.site

RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ITKR")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ANTsRCore")'
RUN R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ANTsR")'

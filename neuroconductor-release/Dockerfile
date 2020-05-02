FROM adigherman/neuro-base-xenial

## Set default CRAN repo
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /usr/local/lib/R/etc/Rprofile.site

## Install neurocLite.R
RUN R -e 'source("https://neuroconductor.org/neurocLite.R")'
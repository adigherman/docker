FROM adigherman/neuro-base-xenial

## Configure CRAN mirror
RUN echo 'options(repos=structure(c(CRAN="http://archive.linux.duke.edu/cran/")))' >> /usr/local/lib/R/etc/.Rprofile

## Install neurocLite.R
RUN R -e 'source("https://neuroconductor.org/neurocLite.R")'
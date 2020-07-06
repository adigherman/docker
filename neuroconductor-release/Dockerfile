FROM adigherman/neuro-base-xenial
ENV RGL_USE_NULL=TRUE

## Set default CRAN repo
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /usr/local/lib/R/etc/Rprofile.site \
## here's some commands to install R packages, I would add at least these
  && R -e 'install.packages("devtools", repos="http://cran.rstudio.com/")' \
  && R -e 'install.packages("rmarkdown", repos="http://cran.rstudio.com/")' \
  && R -e 'install.packages("tidyverse", repos="http://cran.rstudio.com/")' \
## Install limma
  && R -e 'install.packages("BiocManager"); BiocManager::install("limma")' \
## Install alleviateR for rtapas
  && R -e 'remotes::install_github("avalcarcel9/aliviateR")' \
## Install Neuroconductor Packages
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("gifti")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.base")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("waveslim")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ROpenCVLite")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("RNifti")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.mricloud")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("nitrcbot")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("dcm2niir")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("DensParcorr")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("dcmtk")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("cfma")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("I2C2")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ggseg")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.mt")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("fmriqa")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("divest")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("oro.nifti")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("stapler")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("Rvision")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.asl")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.det2")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.t1")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.t2")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.flair")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.fmri")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.vaso")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.dti")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("kirby21.smri")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("Rxnat")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ITKR")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("MriCloudR")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("MRIcloudT1volumetrics")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("malf.templates")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("neurohcp")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ANTsRCore")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ANTsR")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("RNiftyReg")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("fmri")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("msmri")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("EveTemplate")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("MNITemplate")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("sublime")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("brainR ")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("oro.dicom")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("WhiteStripe")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("cifti")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("voxel")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("oro.asl")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ggBrain")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("neurovault")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("sri24")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("gganatogram")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("spant")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("neurobase")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("dcemriS4")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("cap")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("flexconn")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("papayar")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("itksnapr")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("rcamino")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ggneuro")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("papayaWidget")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("afnir")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("oro.pet")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("dti")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("neurocInstall")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("spm12r")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("brainKCCA")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("freesurfer")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("fslr")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("RAVEL")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("oasis")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("dcmsort")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("pain21")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("robex")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("extrantsr")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ichseg")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("lungct")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("smri.process")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("bftools")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("penn115")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("LINDA")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("LESYMAP")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("mni")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("eegUtils")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("nsrr")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("pbj")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("aal")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("radtools")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("RAVELData")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("medals")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("ggsegExtra")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("rtapas")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("mimosa")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("neurocStats")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("RIA")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("alvin")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("aws")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("NiftiArray")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("qMRI")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("mmand")' \
  && R -e 'source("https://neuroconductor.org/neurocLite.R"); neuro_install("clever")'

FROM rocker/tidyverse

## This handle reaches Thierry
MAINTAINER "Thierry Onkelinx" emarginatus@muscardinus.be

## install rgdal
RUN apt-get update \
  &&  apt-get -y --no-install-recommends install \
    libgdal-dev \
    libproj-dev \
  && Rscript -e "install.packages('rgdal', repos = 'http://cran.rstudio.com')"

## install rgeos
RUN Rscript -e "install.packages('rgeos', repos = 'http://cran.rstudio.com')"

## install raster
RUN Rscript -e "install.packages('raster', repos = 'http://cran.rstudio.com')"

## install rmarkdown
RUN Rscript -e "install.packages('rmarkdown', repos = 'http://cran.rstudio.com')"

## install htmlwidgets
RUN Rscript -e "install.packages('htmlwidgets', repos = 'http://cran.rstudio.com')"

## install leaflet
RUN Rscript -e "devtools::install_github('rstudio/leaflet')"

## install ggvis
RUN Rscript -e "install.packages('ggvis', repos = 'http://cran.rstudio.com')"

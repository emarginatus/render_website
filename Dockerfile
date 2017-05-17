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

## install revealjs
RUN Rscript -e "install.packages('revealjs', repos = 'http://cran.rstudio.com')"

## install curl
RUN apt-get update \
  && apt-get -y --no-install-recommends install \
    curl
## add extra fonts
RUN mkdir ~/.fonts \
  && cd ~/.fonts \
  && wget http://download.damieng.com/fonts/redistributed/DroidFamily.zip \
  && unzip DroidFamily.zip \
  && rm DroidFamily.zip \
  && wget https://github.com/stv0g/unicode-emoji/raw/master/symbola/Symbola.ttf

## install ggplot2
RUN Rscript -e "install.packages('ggplot2', repos = 'http://cran.rstudio.com')"

## install tibble
RUN Rscript -e "install.packages('tibble', repos = 'http://cran.rstudio.com')"

## install dplyr
RUN Rscript -e "install.packages('dplyr', repos = 'http://cran.rstudio.com')"

## install tidyr
RUN Rscript -e "install.packages('tidyr', repos = 'http://cran.rstudio.com')"

## install qrcode
RUN Rscript -e "install.packages('qrcode', repos = 'http://cran.rstudio.com')"

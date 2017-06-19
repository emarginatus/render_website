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

## install leaflet
RUN Rscript -e "devtools::install_github('rstudio/leaflet')"

## install ggvis
RUN Rscript -e "install.packages('ggvis', repos = 'http://cran.rstudio.com')"

## install revealjs
RUN Rscript -e "install.packages('revealjs', repos = 'http://cran.rstudio.com')"

## add extra fonts
RUN mkdir ~/.fonts \
  && cd ~/.fonts \
  && wget http://download.damieng.com/fonts/redistributed/DroidFamily.zip \
  && unzip DroidFamily.zip \
  && rm DroidFamily.zip \
  && wget https://github.com/stv0g/unicode-emoji/raw/master/symbola/Symbola.ttf

## install qrcode
RUN Rscript -e "install.packages('qrcode', repos = 'http://cran.rstudio.com')"

## install blogdown and dependecies
RUN Rscript -e "devtools::install_github('rstudio/blogdown')" \
  && Rscript -e "blogdown::install_hugo()"

# install curl
RUN apt-get update \
  && apt-get -y --no-install-recommends install \
    curl

# install XML
RUN Rscript -e "install.packages('XML', repos = 'http://cran.rstudio.com')"

# install INLA
RUN Rscript -e 'install.packages("INLA", repos="https://inla.r-inla-download.org/R/stable")'

# install plotROC
RUN Rscript -e 'install.packages("plotROC", repos="http://cran.rstudio.com")'

# install mapview
RUN apt-get update \
  && apt-get -y --no-install-recommends install \
    libudunits2-dev 
    bzip2 \
  && Rscript -e "install.packages('mapview', repos = 'http://cran.rstudio.com')" \
  && Rscript -e "webshot::install_phantomjs()"

CMD ["/bin/bash"]

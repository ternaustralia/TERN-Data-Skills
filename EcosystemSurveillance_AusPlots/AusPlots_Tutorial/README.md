## Understanding and using the ‘ausplotsR’ package and AusPlots data

The accompanying ‘R’, ‘html’, and 'pdf’ files contain the materials for the tutorial on TERN's Ecosystem Surveillance AusPlots Rangeland data. A file containing the jupyter notebook version of the tutorial (i.e. '.ipynb' file) is also included.  

This tutorial explores the use of the R package ‘ausplotsR’ & the ‘ausplots’ data that can be downloaded with this package. It covers all *ausplotsR* functions, with examples of manipulation, visualisation, and analysis of AusCover data.


&nbsp;
### Getting Started

This tutorial uses R and a number of R packages. The packages required and how to install them are described below.

#### Prerequisites

To run the R scripts in this tutorial a number of R packages (and their dependencies) must be installed. In addition to `ausplotsR`, which is at the core of this tutorial, the following packages are required: `dendextend`, `ggplot2`, `goeveg`, `gridExtra`, `mapdata`, `maps`, `maptools`, `sp`, and `vegan`.

#### Installing
The first step to install packages in R is selecting the CRAN (Comprehensive R Archive Network) mirror. Mirror selection and package installation can be done via R's menu (Packages/Set CRAN mirror... followed by Packages/install package(s)...) or programmatically the function `install.packages` (selecting the CRAN mirror using the argument `repos`). Typically is best to choose the `cloud` mirror (which automatically redirects to an appropriate server worldwide) or a mirror close to you (e.g. in your institution, country,..). A list of Comprehensive R Archive Network (CRAN) mirror URLs can be found [here](https://cran.r-project.org/mirrors.html). 


To install any of the required packages but `ausplotsR`, which is a special case (see below)

```{r, message=FALSE, warning=FALSE, error=FALSE}

## Select the repository (i.e. CRAN mirror URL)
my.repos = "https://cloud.r-project.org/"
#my.repos = "https://cran.csiro.au/"  # Example of an Australian mirror

## Install other required libraries
install.packages(c("ausplotsR", "vegan", "goeveg", "maps", "maptools", "mapdata", "sp", ggplot2", "gridExtra", "ggspatial", "dendextend"), repos=my.repos)
```

To load use the `library` command as follows

```{r, message=FALSE, warning=FALSE, error=FALSE}

# Load packages
library(ausplotsR)  # If not loaded above
library(vegan)
library(goeveg)

library(maps)
library(maptools)
library(mapdata)
library(sp)
library(ggplot2)
library(gridExtra)
#library(ggspatial)

library(dendextend)
```


Currently `ausplotsR` must be installed directly from github using the 'devtools' package, which must have been previously installed. The GitHub site for `ausplotsR` contains the latest developments and information on the package; it can be found in [this link](https://github.com/ternaustralia/ausplotsR).

```{r, message=FALSE, warning=FALSE, error=FALSE}

## Install directly from github using the 'devtools' package
## Thus, 'devtools' must be previouly installed
install.packages("devtools", repos="https://cloud.r-project.org/")
library(devtools)
install_github("ternaustralia/ausplotsR", build_vignettes = TRUE)

## Load the package
library(ausplotsR)

## Obtaining Help and Initial Steps
help(ausplotsR)
browseVignettes(package="ausplotsR")
```


&nbsp;
### Data

In the tutorial, TERN AusPlots Rangelands ecosystem monitoring plot data on vegetation and soil are used. All required data are directly obtained with the package ausplotsR, no other data downloads are required.


&nbsp;
### Citation

Please cite this tutorial as: 

Blanco-Martin, Bernardo (2019). 
Tutorial: "Understanding and using the ‘ausplotsR’ package and AusPlots data". 
Terrestrial Ecology Research Network.
Version 2019.04.0, April 2019.
https://github.com/ternaustralia/TERN-Data-Skills/tree/master/EcosystemSurveillance_AusPlots/AusPlots_Tutorial


&nbsp;
### License

This tutorial is licensed under Creative Commons 'Attribution' (CC BY 4.0) license.

<img src="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png" alt="drawing" width="200"/>


&nbsp;
### Acknowledgments
Dr. Greg Guerin  (TERN Ecosystem Surveillance and AusPlots program).













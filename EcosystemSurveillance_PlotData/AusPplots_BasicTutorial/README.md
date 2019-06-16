## 'AusplotsR' Package and AusPlots Data Basics

The accompanying ‘html’, 'pdf’, 'R', and 'Rmd' files contain the materials for a basic tutorial on TERN's Ecosystem Surveillance AusPlots Rangeland data. A file containing the jupyter notebook version of the tutorial (i.e. '.ipynb' file) is also included.  

This tutorial explores the use of the R package ‘ausplotsR’ to extract and prepare AusPlots data for visualisation and analysis. It shows how to download and install the 'ausplotsR' package, as well as how to use all its functions. Detailed explanations and examples are provided for the use of the arguments of all 'ausplotsR' functions. In addition, the tutorial covers how to manipulate (i.e. subset/filter and merge) and save the extracted AusPlots data. 

Another Tutorial in TERN's Data Skills Development Program ("Understanding and using the ‘ausplotsR’ package and AusPlots data") provides a briefier introduction to the use of 'ausplotsR' functions (i.e. providing examples of the use of the functions with the most common arguments only). However, the latter tutorial also covers how to further manipulate, visualise, and use AusPlots data, by using common application examples. Further examples of the use and applications of 'ausplotsR' are provided in the "'ausplotsR' Examples" folder at 'TERN-Data-Skills' GitHub repository.


&nbsp;
### Tutorial Materials and How to Obtain them

All the required materials for the tutorial can be downloaded from this section of TERN's Data Skills Development Program GitHub pages; see the links above this README.md file. GitHub is a little bit fiddly and the procedures to download different file types differ slightly. These procedures, along with a brief description of the file contents, are described below.

#### '.html'

This file contains: (1) explanations for the tutorial aims and methods, code, and outputs (i.e. results); (2) R code; and (3) code outputs. This will be the main file that we will use in the workshop. To download it: (1) click on the link for the '.html' file, (2) click on the 'View raw' link at the top of Viewer, (3) right click anywhere in the Viewer, then chose 'Save as...', and (4) choose the location and a name for the file, then click on the 'Save' button.

#### '.pdf' 

This file contains the pdf version of the '.html' file. To download it: (1) click on the link for the '.pdf' file, (2) click on the 'Download' button above the Viewer, (3) choose the location and a name for the file, then click on the 'Save' button.  

#### '.r'

This file contains the R code for the tutorial. It is heavily commented, including the comments in the '.html' file. To download it: (1) click on the link for the '.r' file, (2) click on the 'Raw' button above the Viewer, (3) right click anywhere in the Viewer, then chose 'Save as...', and (4) choose the location and a name for the file, delete the extension '.txt' automatically added to the name by GitHub (the file already includes the correct extension '.r'), then click on the 'Save' button.

#### '.Rmd'
This file contains the R and Rmarkdown code used to generate the '.html' file (see above) in R-Studio.  To download it: (1) 

#### '.ipynb' 

This file contains the jupyter notebook version of the tutorial. To download it: (1) click on the link for the '.ipynb' file, (2) click on the 'Download' button above the Viewer, (3) right click anywhere in the Viewer then chose 'Save as...', and (4) choose the location and a name for the file, then click on the 'Save' button. 

#### Download or clone all the materials in TERN's Data SKills Development Program GitHub pages

Navigate to [TERN's Data SKills Development Program GitHub](https://github.com/ternaustralia/TERN-Data-Skills) main page. Click on the "Clone or download" green button. From here you can download a zip file with the materials for all TERN's DSDP Tutorials and Workshops. Alternatively, you can also clone these materials using Git.


&nbsp;
### Getting Started with the Tutorial

This tutorial uses R and a the 'ausplotsR' package. Instructions in how to install the 'ausplotsR' package are provided below.

#### Installation
The first step to install packages in R is selecting the CRAN (Comprehensive R Archive Network) mirror. Mirror selection and package installation can be done via R's menu (Packages/Set CRAN mirror... followed by Packages/install package(s)...) or programmatically the function `install.packages` (selecting the CRAN mirror using the argument `repos`). Typically is best to choose the `cloud` mirror (which automatically redirects to an appropriate server worldwide) or a mirror close to you (e.g. in your institution, country,..). A list of Comprehensive R Archive Network (CRAN) mirror URLs can be found [here](https://cran.r-project.org/mirrors.html). 

```{r, message=FALSE, warning=FALSE, error=FALSE}

## Select the repository (i.e. CRAN mirror URL)
my.repos = "https://cloud.r-project.org/"
#my.repos = "https://cran.csiro.au/"  # Example of an Australian mirror

```

Currently `ausplotsR` must be installed directly from GitHub using the 'devtools' package, which must have been previously installed. The GitHub site for `ausplotsR` contains the latest developments and information on the package; it can be found in [this link](https://github.com/ternaustralia/ausplotsR).

```{r, message=FALSE, warning=FALSE, error=FALSE}

# Install directly from github using the 'devtools' package
# Thus, 'devtools' must be previouly installed
install.packages("devtools", repos=my.repos)
library(devtools)
install_github("ternaustralia/ausplotsR", build_vignettes = TRUE)

# Load the package
library(ausplotsR)

# Obtaining Help and Initial Steps
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
Tutorial: "'AusplotsR' Package and AusPlots Data Basics". 
Terrestrial Ecology Research Network.
Version 2019.06.0, June 2019.
https://github.com/ternaustralia/TERN-Data-Skills/tree/master/EcosystemSurveillance_AusPlots/AusPlots_Tutorial


&nbsp;
### License

This tutorial is licensed under Creative Commons 'Attribution' (CC BY 4.0) license.

<img src="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png" alt="drawing" width="200"/>


&nbsp;
### Acknowledgments

Dr. Greg Guerin  (TERN Ecosystem Surveillance and AusPlots program).

TERN is funded through the National Collaborative Research Infrastructure Strategy (NCRIS), an Australian Government Initiative.












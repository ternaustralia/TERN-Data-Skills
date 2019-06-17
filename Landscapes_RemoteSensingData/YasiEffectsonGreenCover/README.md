<center> <h2>
Investigation of the Effects of Cyclone Yasi on Green Cover Fraction at Mission Beach using TERN’s Remote Sensing Data
</h2> </center>

&nbsp;

The accompanying ‘R’, ‘html’, and 'pdf’ files contain the materials for TERN's "Investigation of the Effects of Cyclone Yasi on Green Cover Fraction at Mission Beach using TERN’s Remote Sensing Data" tutorial. The tutorial explores the effect of Cyclone Yasi on the green vegetation fraction in Djiru National Park at the backdrop of Mission Beach. In the process it explains and allows familiarisation with the use of remote sensing data (particularly TERN’s data) in R. 

To investigate the effect of cyclone Yasi on the green vegetation do so we will compare Remote Sensing images taken before and after the cyclone landfall over the Djiru National Park at the backdrop of Mission Beach. Specifically we will compare seasonal image composites of the two types of TERN’s remote sensing fractional cover data, Persistent Green Cover & Green Ground Cover, for the Winters (June to August) of 2010 and 2011.

This tutorial is part of TERN’s (Terrestrial Ecology Research Network) DSDP (Data Skills Development Program). Detailed information on how to use raster data in R can be found in TERN’s DSDP “Using Raster Data in R” tutorial. Additional examples of the usage of TERN’s Remote Sensing data can be found in TERN’s DSDP “Green Vegetation Temporal Dynamics: Monitoring and Analysis using NDVI and Fractional Cover TERN rasters (Parts 1 & 2)” tutorials. 


&nbsp;
### Tutorial Materials and how to Obtain them

All the required materials for the tutorial can be downloaded from this section of TERN's Data Skills Development Program GitHub pages; see the links above this README.md file. GitHub is a little bit fiddly and the procedures to download different file types differ slightly. These procedures, along with a brief description of the file contents, are described below.

#### '.html'

This file contains: (1) explanations for the tutorial aims and methods, code, and outputs (i.e. results); (2) R code; and (3) code outputs. This is the main document and the best starting point for the tutorial. To download it: (1) click on the link for the '.html' file, (2) click on the 'View raw' link at the top of Viewer, (3) right click anywhere in the Viewer, then chose 'Save as...', and (4) choose the location and a name for the file, then click on the 'Save' button.

#### '.pdf' 

This file contains the pdf version of the '.html' file. To download it: (1) click on the link for the '.pdf' file, (2) click on the 'Download' button above the Viewer, (3) choose the location and a name for the file, then click on the 'Save' button.  

#### '.r'

This file contains the R code for the tutorial. It is heavily commented, including the comments in the '.html' file. To download it: (1) click on the link for the '.r' file, (2) click on the 'Raw' button above the Viewer, (3) right click anywhere in the Viewer, then chose 'Save as...', and (4) choose the location and a name for the file, delete the extension '.txt' automatically added to the name by GitHub (the file already includes the correct extension '.r'), then click on the 'Save' button.

#### '.Rmd'

This file contains the R and Rmarkdown code used to generate the '.html' file (see above) in R-Studio.  The downloading procedure is as for '.r' files. That is, to download it: (1) click on the link for the '.Rmd' file, (2) click on the 'Raw' button above the Viewer, (3) right click anywhere in the Viewer, then chose 'Save as...', and (4) choose the location and a name for the file, delete the extension '.txt' automatically added to the name by GitHub (the file already includes the correct extension '.Rmd'), then click on the 'Save' button.

#### '.ipynb' 

This file contains the jupyter notebook version of the tutorial. To download it: (1) click on the link for the '.ipynb' file, (2) click on the 'Download' button above the Viewer, (3) right click anywhere in the Viewer then chose 'Save as...', and (4) choose the location and a name for the file, then click on the 'Save' button. 

#### Download or clone all the materials in TERN's Data SKills Development Program GitHub pages

Navigate to [TERN's Data SKills Development Program GitHub](https://github.com/ternaustralia/TERN-Data-Skills) main page. Click on the "Clone or download" green button. From here you can download a zip file with the materials for all TERN's DSDP Tutorials and Workshops. Alternatively, you can also clone these materials using Git.


&nbsp;
### Getting Started with the Tutorial

This tutorial uses R and a number of R packages. The packages required and how to install them are described below.


#### Prerequisites

To run the R scripts in this tutorial the following R packages (and their dependencies) must be installed: ggmap, ggplot2, gridExtra, raster, rasterVis, RColorBrewer, reshape2, rgdal, RStoolbox, and sp. 


#### Installing

First select a repository. 

```
# Select the repository (i.e. CRAN mirror URL)
my.repos = "https://cloud.r-project.org/" # Automatic redirection to servers worldwide
#my.repos = "https://cran.csiro.au/"  # Example of an Australian mirror
```
Install all the required packages in the usual way in R; except 'ggmap', which is a special case (see below)

```
# Install the required libraries
install.packages(c("ggplot2", "gridExtra", "raster", "rasterVis", "RColorBrewer", "reshape2", "rgdal", "RStoolbox", "sp", "ncdf4"), repos=my.repos)
```

When installing 'ggmap' you might need to install the development version from GitHub, rather than the CRAN version (to avoid some bugs present in the package at the time that this tutorial was developed). In this case, you will need to previously install and use the 'devtools' library to intall the 'ggmap' package from GitHub. To do so use the following code.

```
# Install 'ggmap' development version from GitHub
install.packages("devtools", repos=my.repos)
library(devtools)
devtools::install_github("dkahle/ggmap", force=TRUE)
```


#### NOTE on using Google Maps

In the tutorial Stamen maps are downloaded and plotted using the `ggmap` package. This package can also retrieve the better known Google Maps (as well as other maps). However, Google has changed its API requirements. Now, to use Google Maps with the 'ggmap' library users are required to register, which involves providing a credit card number. Light usage have no charge to a modest charge. More information can be found in the ['ggmap' GitHub pages](https://github.com/dkahle/ggmap) and [Google developers pages](https://developers.google.com/maps/documentation/geocoding/usage-and-billing).


&nbsp;
### Data

We will investigate the effects of cyclone Yasi on green vegetation at Djiru National Park using two of TERN's Remote Sensing data products: Seasonal Persistent Green Cover & Seasonal Green Ground Cover. Seasonal persistent green cover estimates the portion of vegetation that does not completely senesce within a year, which primarily consists of woody vegetation (trees and shrubs). Seasonal Green Ground Cover estimates of ‘true’ green ground cover for each season, restricted to areas of less than 60% woody vegetation, by combining information from the Seasonal Persistent Green and Seasonal Fractional Cover products.

To investigate the effects of cyclone Yasi we will compare Remote Sensing images taken before and after the cyclone landfall. Specifically we will compare seasonal image composites of both SPGC and SGGC for the Winters (June to August; 3 month image composites) of 2010 and 2011.
   
All datasets are to be programmatically downloaded in the tutorial with the provided code (this constitutes part of the training exercise). Nevertheless, here are the paths and file names of the required datasets:

* Seasonal Persistent Green Cover remote sensing data: 
  * Path: http://qld.auscover.org.au/public/data/landsat/seasonal_fractional_cover/persistent_green/aus/
  * Files: 
    * SPGC Winter 2010: lztmre_aus_m201006201008_djaa2.vrt
    * SPGC Winter 2011: lztmre_aus_m201106201108_djaa2.vrt
    * SPGC Winter Time Series: lztmre_aus_s198912201611_djaa2_persistent.vrt

* Seasonal Green Ground Cover remote sensing data: 
  * Path: http://qld.auscover.org.au/public/data/landsat/seasonal_fractional_cover/ground_cover/aus/
  * File - SPGC Winter Time Series: lztmre_aus_s198912201811_dixa2_green.vrt. 


&nbsp;
### Citation

Please cite this tutorial as: 

Blanco-Martin, Bernardo (2019).
Tutorial: "Investigation of the Effects of Cyclone Yasi on Green Cover Fraction at Mission Beach using TERN’s Remote Sensing Data".
Terrestrial Ecology Research Network.
Version 2019.05.0, May 2019.
https://github.com/ternaustralia/TERN-Data-Skills/tree/master/Landscapes_AusCover-RemoteSensing/GreenVegetationTemporalDynamics


&nbsp;
### License

This tutorial is licensed under Creative Commons 'Attribution' (CC BY 4.0) license.

<img src="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png" alt="drawing" width="200"/>


&nbsp;
### Acknowledgments

TERN is funded through the National Collaborative Research Infrastructure Strategy (NCRIS), an Australian Government Initiative.




<center> <h2>
Green Vegetation Temporal Dynamics: Monitoring and Analysis using NDVI and Fractional Cover TERN rasters
</h2> </center>

The accompanying ‘R’, ‘html’, and 'pdf’ files contain the materials for the two parts tutorial *'Green Vegetation Temporal Dynamics: Monitoring and Analysis using NDVI and Fractional Cover TERN rasters'*.   A file containing the jupyter notebook version of the tutorial (i.e. '.ipynb' file) is also included. 

The tutorial explores how to monitor and analyse the temporal dynamics of green vegetation. To monitor these temporal dynamics it utilizes the Normalize Difference Vegetation Index (NDVI), which is computed in the tutorial from composited seasonal Surface Reflectance images. To analyse the causes of the green vegetation temporal dynamics we will explore the changes in the Green Cover Fraction over time. All the datasets used in this tutorial are products of TERN’s Landscapes Assessment (AusCover) facility.

This tutorial is based on Peter Scarth’s "Simple Change Detection in Raster using TERN web services and Google Earth Engine" tutorial. Although it (more or less) follows Dr. Scarth’s tutorial steps, both tutorials differ in some of their contents. In addition, Dr. Scarth’s tutorial in implemented in python, while we will use R.

Due to its length, this tutorial has been divided into two parts. Part 1 describes how to perform the necessary steps required to obtain, manipulate, and display rasters in R using TERN’s surface reflectance datasets as an example (see below). More detailed descriptions and explanations of these (and many other) raster operations in R are provided in TERN’s “Using Raster Data in R” tutorial. Part 2 conducts the bulk of the computation and analysis of the temporal dynamics of green vegetation, which includes (among others) operations to subset, combine, and display rasters. It also makes use of most of the steps presented in Part 1, but in Part 2 these steps are included in a function. 


&nbsp;
### Getting Started

This tutorial uses R and a number of R packages. The packages required and how to install them are described below.

#### Prerequisites

To run the R scripts in this tutorial the following R packages (and their dependencies) must be installed: dplyr, ggmap, ggplot2, gridExtra, raster, rasterVis, RColorBrewer, reshape2, rgdal, RStoolbox, sp, stringr, and XML. 

#### Installing

The R packages required for this tutorial are installed in the usual way in R (after selecting a repository).

```
install.packages(c("dplyr", "ggmap", "ggplot2", "gridExtra", "raster", "rasterVis", "RColorBrewer", "reshape2", "rgdal", "RStoolbox", "sp", "stringr", "XML"))
```

When installing 'ggmap' you might need to install the development version rather than the CRAN version (to avoid some bugs present in the package at the time that this tutorial was developed). In this case, you will need to previously install and use the 'devtools' library to intall the 'ggmap' package from GitHub. To do so use the following code.

```
install.packages("devtools")
library(devtools)
devtools::install_github("dkahle/ggmap", force=TRUE)
```

#### NOTE on using Google Maps

The initial version of this tutorial used 'Google Maps'. However, Google has changed its API requirements. Now, to use Google Maps with the 'ggmap' library users are required to register, which involves providing a credit card number. Light usage have no charge to a modest charge. More information can be found in the ['ggmap' GitHub pages](https://github.com/dkahle/ggmap) and [Google developers pages](https://developers.google.com/maps/documentation/geocoding/usage-and-billing).


&nbsp;
### Data

To analyse changes in Normalized Difference Vegetation Index (NDVI) over time, datasets containing composited seasonal surface reflectance images (4 seasons per year) are used. These datasets were created from full time series of Landsat TM/ETM+ imagery. The imagery was composited over a season to produce new imagery that is representative of the period. In this process, techniques that reduce contamination by cloud and other problems were used. 
   
   The final part of this section of the workshop explores the causes of NDVI change in the area of most noticeable greening. To do so, a time series of the green fraction is plotted. The green fraction is one of the bands in the fractional cover product. This is another AusCover product hosted by TERN.
   
   All these datasets are to be programmatically downloaded in the workshop with the provided code (i.e. this constitutes part of the training exercise). Nevertheless, here are the paths and file names of the required datasets:

* Composited Seasonal Reflectance Images: 
  * Path: http://qld.auscover.org.au/public/data/landsat/surface_reflectance/aus
  *Files: 
    * l8olre_aus_m201609201611_dbia2.vrt
    * lztmre_aus_m200703200705_dbia2.vrt
    * l8olre_aus_m201703201705_dbia2.vrt

* Fractional Cover data product: 
  * Path: http://qld.auscover.org.au/public/data/landsat/seasonal_fractional_cover/fractional_cover/aus
  * File:  The name of the required vrt data files containing the time series of green fractional cover changes every ~3 months, as information for a new season is added to the previous data. In the tutorial the the name of the current data file containing the time series of green cover fractions is extracted programmatically in the script. 


&nbsp;
### Citation

Please cite this tutorial as: 

Blanco-Martin, Bernardo (2019).
Tutorial: "Green Vegetation Temporal Dynamics: Monitoring and Analysis using NDVI and Fractional Cover TERN rasters".
Terrestrial Ecology Research Network.
Version 2019.04.0, April 2019.
https://github.com/ternaustralia/TERN-Data-Skills/tree/master/Landscapes_AusCover-RemoteSensing/GreenVegetationTemporalDynamics


&nbsp;
### License

This tutorial is licensed under Creative Commons 'Attribution' (CC BY 4.0) license.

<img src="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png" alt="drawing" width="200"/>


&nbsp;
### Acknowledgments
Dr. Peter Scarth  (TERN Landscape Assessment facility, Remote Sensing).













<center> <h2>
Investigation of the Effects of Cyclone Yasi on Green Cover Fraction at Mission Beach using TERN’s Remote Sensing Data
</h2> </center>

&nbsp;

The accompanying ‘R’, ‘html’, and 'pdf’ files contain the materials for TERN's workshop tutorial to be delivered in the FunGIS conference (Cairns, 16th-17th May 2019). In this workshop we explore the effect of Cyclone Yasi on the green vegetation fraction in Djiru National Park at the backdrop of Mission Beach. In the process we will explain and familiarise with the use of remote sensing data (particularly TERN’s data) in R. 

To investigate the effect of cyclone Yasi on the green vegetation do so we will compare Remote Sensing images taken before and after the cyclone landfall over the Djiru National Park at the backdrop of Mission Beach. Specifically we will compare seasonal image composites of the two types of TERN’s remote sensing fractional cover data, Persistent Green Cover & Green Ground Cover, for the Winters (June to August) of 2010 and 2011.

An expanded version (additional explanations and some extra code) of the workshop tutorial can be found in TERN’s DSDP “Investigation of the Effects of Cyclone Yasi on Green Cover Fraction at Mission Beach using TERN’s Remote Sensing Data” tutorial. Detailed information on how to use raster data in R can be found in TERN’s DSDP “Using Raster Data in R” tutorial. Additional examples of the usage of TERN’s Remote Sensing data can be found in TERN’s DSDP “Green Vegetation Temporal Dynamics: Monitoring and Analysis using NDVI and Fractional Cover TERN rasters (Parts 1 & 2)” tutorials. 


&nbsp;
### Getting Started

In this workshop we will use R and a number of R packages. The packages required and how to install them are described below.

#### Prerequisites

To run the R scripts in this workshop tutorial the following R packages (and their dependencies) must be installed: ggmap, ggplot2, gridExtra, raster, rasterVis, RColorBrewer, reshape2, rgdal, RStoolbox, and sp. 

#### Installing

The R packages required for this workshop tutorial are installed in the usual way in R (after selecting a repository).

```
install.packages(c("ggmap", "ggplot2", "gridExtra", "raster", "rasterVis", "RColorBrewer", "reshape2", "rgdal", "RStoolbox", "sp"))
```

When installing 'ggmap' you might need to install the development version rather than the CRAN version (to avoid some bugs present in the package at the time that this tutorial was developed). In this case, you will need to previously install and use the 'devtools' library to intall the 'ggmap' package from GitHub. To do so use the following code.

```
install.packages("devtools")
library(devtools)
devtools::install_github("dkahle/ggmap", force=TRUE)
```

#### NOTE on using Google Maps

In the workshop we download and plot Stamen maps using the `ggmap` package. This package can also retrieve the better known Google Maps (as well as other maps). However, Google has changed its API requirements. Now, to use Google Maps with the 'ggmap' library users are required to register, which involves providing a credit card number. Light usage have no charge to a modest charge. More information can be found in the ['ggmap' GitHub pages](https://github.com/dkahle/ggmap) and [Google developers pages](https://developers.google.com/maps/documentation/geocoding/usage-and-billing).


&nbsp;
### Data

We will investigate the effects of cyclone Yasi on green vegetation at Djiru National Park using two of TERN's Remote Sensing data products: Seasonal Persistent Green Cover & Seasonal Green Ground Cover. Seasonal persistent green cover estimates the portion of vegetation that does not completely senesce within a year, which primarily consists of woody vegetation (trees and shrubs). Seasonal Green Ground Cover estimates of ‘true’ green ground cover for each season, restricted to areas of less than 60% woody vegetation, by combining information from the Seasonal Persistent Green and Seasonal Fractional Cover products.

To investigate the effects of cyclone Yasi we will compare Remote Sensing images taken before and after the cyclone landfall. Specifically we will compare seasonal image composites of both SPGC and SGGC for the Winters (June to August; 3 month image composites) of 2010 and 2011.
   
All datasets are to be programmatically downloaded in the workshop with the provided code (this constitutes part of the training exercise). Nevertheless, here are the paths and file names of the required datasets:

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

Please cite this workshop tutorial as: 

Blanco-Martin, Bernardo (2019).
Workshop tutorial: "Investigation of the Effects of Cyclone Yasi on Green Cover Fraction at Mission Beach using TERN’s Remote Sensing Data".
Terrestrial Ecology Research Network.
Version 2019.05.0, May 2019.
https://github.com/ternaustralia/TERN-Data-Skills/tree/master/Landscapes_AusCover-RemoteSensing/GreenVegetationTemporalDynamics


&nbsp;
### License

This workshop tutorial is licensed under Creative Commons 'Attribution' (CC BY 4.0) license.

<img src="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png" alt="drawing" width="200"/>















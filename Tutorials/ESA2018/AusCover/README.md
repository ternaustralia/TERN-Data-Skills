## Simple Change Detection in Raster using TERN web services
     
   The accompanying ‘html’ and ‘Rmd’ files contain the Landscape Assessment (AusCover) section of TERN’s workshop at the Ecological Society of Australia 2018 conference. This section of the workshop is based on Peter Scarth’s tutorial "Simple Change Detection in Raster using TERN web services and Google Earth Engine" available in https://github.com/AusCover/virtual-raster-access. Although it (more or less) follows Dr. Scarth’s tutorial steps, it has some variation in its content. Dr. Scarth’s tutorial uses a Jupyter Notebook with code in Python. In the workshop, R is used.


### Running notes

#### R packages

To run the corresponding R and Rmd scripts the following R packages (and their dependencies) must be installed: dplyr, ggmap, ggplot2, gridExtra, raster, rasterVis, RColorBrewer, reshape2, rgdal, RStoolbox, sp, stringr. 
   
   These packages can be installed in the usual way in R:
   
```
# Select the repository (i.e. CRAN mirror URL)
my.repos = "https://cloud.r-project.org/"
#my.repos = "https://cran.csiro.au/"
# Install other required libraries
install.packages(c("dplyr", "reshape2", "stringr", "RColorBrewer", "ggplot2", "gridExtra", "RStoolbox", "sp", "rgdal", "raster", "rasterVis", "ggmap"), repos=my.repos)
```

#### Data

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
  * File:  lztmre_aus_s198712201808_dima2_green.vrt


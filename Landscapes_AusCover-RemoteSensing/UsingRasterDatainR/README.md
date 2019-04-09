## Using Raster Data in R

The accompanying ‘R’, ‘html’, and 'pdf’ files contain the materials for the tutorial *'Using Raster Data in R'*. In this tutorial synthetic data is used to explain and demonstrate in detail how to work with raster data in R. The tutorial covers the following raster operations: 

1. Introduction
2. Raster Classes
3. Preparation
4. Creating Rasters: Adding, Dropping, and Subsetting Layers
5. Loading and Saving Rasters
6. Navigating Rasters
	1. Dimensions of a raster
	2. Names of raster
	3. Number of rows, columns, and cells
	4. Mapping Cells
	5. Coordinates for the center of raster cells
	6. Columns, Rows, and Cells from Coordinates (at the centre of cells)
7. Examining Raster Contents
	1. Examining raster contents numerically
	2. Visualising raster contents
8. Summarising raster contents
	1. Numerical Summaries
	2. Visual Summaries
9. Working with rasters values
	1. Modifying individual cell values
	2. Raster Calculations: ‘Raster Algebra’ & Raster Calculations using Higher Level Functions
	3. Raster Classification
10. Other ways to Combine multiple Raster objects: ‘mask()’ and ‘cover()’
11. Changing the essential Spatial Attributes of a Raster
	1. Changing Spatial Extent: ‘crop()’, ‘merge()’, ‘trim()’, and ‘extend()’
	2. Changing Resolution
	3. Defining & Changing Spatial Projections
	4. Setting the Spatial Attributes of All Rasters to the same values at once
12. Raster Prediction
	1. Interpolation
	2. Prediction
13 Other GIS operations with rasters in R
	1. Distance & Direction
	2. Spatial autocorrelation Raster
	3. Elevation, slope, aspect


&nbsp;
### Getting Started

This tutorial uses R and a number of R packages. The packages required and how to install them are described below.

#### Prerequisites

To run the R scripts in this tutorial the following R packages (and their dependencies) must be installed: ggplot2, mapdata, maps, maptools, ncdf4, raster, rasterVis, RColorBrewer, rgdal, RColorBrewer, RKEA, and sp. 

#### Installing

The R packages required for this tutorial are installed in the usual way in R (after selecting a repository).

```
install.packages(c("ggplot2", "mapdata", "maps", "maptools", "ncdf4", "raster", "rasterVis", "RColorBrewer", "rgdal", "RColorBrewer", "RKEA", "sp"))
```


&nbsp;
### Data

This tutorial utilizes synthetic data specifically designed to explain and demonstrate particular operations using with raster data in R.


&nbsp;
### Citation

Please cite this tutorial as: 

Blanco-Martin, Bernardo (2019). 
Tutorial: "Using Raster Data in R".
Terrestrial Ecology Research Network.
Version 2019.04.0, April 2019.
https://github.com/ternaustralia/TERN-Data-Skills/tree/master/Landscapes_AusCover-RemoteSensing/UsingRasterDatainR


&nbsp;
### License

This tutorial is licensed under Creative Commons 'Attribution' (CC BY 4.0) license.

<img src="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png" alt="drawing" width="200"/>


&nbsp;
### Acknowledgments
To the authors of many fantastic tutorials on *spatial data* or *raster data in R* that inspired and educated the authors (and this tutorial). 













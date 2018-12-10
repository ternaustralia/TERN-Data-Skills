## Understanding and using the ‘ausplotsR’ package and AusPlots data
   The accompanying ‘html’ and ‘Rmd’ files contain the material for Ecosystem Surveillance (AusPlots) section of TERN’s workshop at the Ecological Society of Australia 2018 conference. In this workshop the use of the package ‘ausplotsR’ & the ‘ausplots’ data that can be downloaded with this package are explored.

### Software Installation
#### R packages
   To run the corresponding R and Rmd scripts the following R packages (and their dependencies) must be installed: ausplotsR, dendextend, ggplot2, goeveg, gridExtra, mapdata, maps, maptools, sp, and vegan. 
   ```
  install.packages("devtools")
  install.packages(c("dendextend","ggplot2","dplyr","ggmap","ggplot2","goeveg","gridExtra","mapdata","maps","maptools","raster","rasterVis","RColorBrewer","reshape2","rgdal","RStoolbox","sp","stringr","vegan"))
   ```
   ‘ausplotsR’ needs to be installed directly from github using the ‘devtools’ package, so this package also need to be installed. Here are the steps to install ‘ausplotsR’ (after installing ‘devtools’).
   ```
   library(devtools)
   install_github("GregGuerin/ausplotsR")
   ```

### Data
   In the workshop, TERN AusPlots ecosystem monitoring plot data on vegetation and soil are used. These data are directly obtained with the package ausplotsR, so no other data downloads are required.


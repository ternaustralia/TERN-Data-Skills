**Understanding and using the &#39;ausplotsR&#39; package and AusPlots data**

   The accompanying &#39;html&#39; and &#39;Rmd&#39; files contain the material for the &quot;Ecosystem Surveillance (AusPlots): Understanding and using the &#39;ausplotsR&#39; package and AusPlots data&quot; tutorial at the ecoED Champions Training 2018 in Canberra. In this tutorial the use of the package &#39;ausplotsR&#39; &amp; the &#39;ausplots&#39; data that can be downloaded with this package are explored.

**Running notes**

*****R packages*****

   To run the corresponding R and Rmd scripts the following R packages (and their dependencies) must be installed: ausplotsR, dendextend, ggplot2, goeveg, gridExtra, mapdata, maps, maptools, sp, and vegan.

   &#39;ausplotsR&#39; needs to be installed directly from github using the &#39;devtools&#39; package, so this package also need to be installed. Here are the steps to install &#39;ausplotsR&#39; (after installing &#39;devtools&#39;).

        library(devtools)
        install_github("GregGuerin/ausplotsR")

   The other packages can be installed in the usual way in R:

 		#Select the repository (i.e. CRAN mirror URL)
		my.repos = "https://cloud.r-project.org/"
		#my.repos = "https://cran.csiro.au/"
		
                #Install other required libraries
		install.packages(c("ausplotsR","vegan","goeveg","maps","maptools","mapdata","sp","ggplot2","gridExtra", "ggspatial","dendextend"),repos=my.repos)

*****Data*****

   In the workshop, TERN AusPlots ecosystem monitoring plot data on vegetation and soil are used. These data are directly obtained with the package ausplotsR, so no other data downloads are required.

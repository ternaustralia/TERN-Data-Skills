#install.packages("reticulate")

####################################################################################################
##
## Example: Accessing terndata.ecoplots from within R using reticulate
##   - Select and download soil colour from the QBEIS dataset 
##   - Plot site coordinates and soil colours
##
####################################################################################################

## load libraries

    ## to run python from within R studio
    library(reticulate)
    ## reticulate downloads the terndata.ecoplots package and manages the environment in the background
    py_require("terndata.ecoplots")
    
    ## transparent colours
    library(scales)
    
## download and prepare data
    
    ## download sample data
    py_run_string("
from terndata.ecoplots import EcoPlots

## load data 
ec = EcoPlots()

## select dataset and feature type
ec.select(dataset='QBEIS',
          feature_type='soil')

## download data and ensure correct type for conversion to R data frame
soil_data = ec.get_data(dformat='pandas')
soil_data = soil_data.astype(object)
               ")
    
    ## import data into R environment
    soil_data = py$soil_data
    
    ## transform pandas N/As into R's native NA format and unlist list columns
    soil_data[soil_data == "N/A"] = NA
    soil_data[] = lapply(soil_data, function(col) {if (is.list(col)) unlist(col) else col})
    
    ## replace "not recorded" entries with NA
    soil_data[soil_data == "not recorded"] = NA
    
## match soil colour with plottable R colours
    
    ## create lookup vector with R colours (note, the colours are just for illustration and not scientific matches)
    col_lookup = c(greyish = "gray50", black = "black", brown = "brown", red = "firebrick2", grey = "grey", yellow = "yellow", orange = "orange", whitish = "gray95", pale = "seashell", mottled = "gray", dark = "grey15")
    soil_data[,"soil_col"] = col_lookup[soil_data[,"soilColour"]]
    
## plot soil colours    
    
    plot(soil_data$longitude_Degree, soil_data$latitude_Degree, pch=19,col=alpha(soil_data[,"soil_col"],0.35),
         ylab="latitude", xlab="longitude", main="Queensland soil colours")
    legend("topright", legend=names(col_lookup), col = col_lookup, pch=19, bty = "n",
           cex=0.9)
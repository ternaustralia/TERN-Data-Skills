####################################################################################################
##
## Example: Accessing terndata.ecoplots from within R using reticulate
##   - Select and download information for site "SAARIV0005" 
##   - Visualize changes in species cover between first and second visit
##
####################################################################################################


## load libraries

## to run python from within R studio
library(reticulate)
## reticulate downloads the terndata.ecoplots package and manages the environment in the background
py_require("terndata.ecoplots")

## download and prepare data

## download sample data
py_run_string("
from terndata.ecoplots import EcoPlots

## load data 
ec = EcoPlots()

## select dataset, feature type and site
ec.select(dataset='TERN Ecosystem Surveillance',
      feature_type = 'plant occurrence',
      site_id = 'SAARIV0005')

## download data and ensure correct type for conversion to R data frame
SAARIV0005_data = ec.get_data(dformat='pandas')
SAARIV0005_data = SAARIV0005_data.astype(object)
              ")

## import data into R environment
site_data = py$SAARIV0005_data

## transform pandas N/As into R's native NA format and unlist list columns
site_data[site_data == "N/A"] = NA
site_data[] = lapply(site_data, function(col) {if (is.list(col)) unlist(col) else col})
    
## prepare data for plotting
    
## separate first and second visit
first_visit = site_data[which(site_data[,"siteVisitName"] == unique(site_data$siteVisitName)[1]),]
second_visit = site_data[which(site_data[,"siteVisitName"] == unique(site_data$siteVisitName)[2]),]

## calculate cover percentage for each species
first_visit_percentage = as.vector(round(table(first_visit[,"scientificName"])/sum(table(first_visit[,"scientificName"])),3))
second_visit_percentage = as.vector(round(table(second_visit[,"scientificName"])/sum(table(second_visit[,"scientificName"])),3))

## create clean species names
axis_names = sub("^(([^ ]+ ){1}[^ ]+).*", "\\1", names(table(first_visit[,"scientificName"])))
    
## plot the change in species cover
    
## TERN colours
tern_dorange = rgb(237, 105, 75, maxColorValue = 255)
tern_dgreen = rgb(0, 86, 93, maxColorValue = 255)

## create plotting space for species names
par(mar=c(8,4,4,2))

## assemble plot
plot(NULL, ylim=c(0,0.5), xlim=c(0,20), yaxt="n", xaxt="n", xlab="", ylab="Percent species cover",main="Change in species cover")
for (n in 1:length(first_visit_percentage)){segments(x0=seq(from=1, to=19, length.out=10)[n],x1=seq(from=2, to=20, length.out=10)[n],y0=first_visit_percentage[n],y1=second_visit_percentage[n])}
points(seq(from=1, to=19, length.out=10), first_visit_percentage, pch=19, col=tern_dgreen)  
points(seq(from=2, to=20, length.out=10), second_visit_percentage, pch=19, col=tern_dorange)
axis(1, at=seq(from=1.5, to=19.5, by=2), labels=axis_names,las=2, cex.axis=0.7)
axis(2, at=seq(from=0, to=0.5, by=0.1), labels=seq(from=0, to=0.5, by=0.1)*100)
legend("topleft", inset=0.02, legend=c("first visit", "second visit"), pch=19, col=c(tern_dgreen, tern_dorange), bty="n")
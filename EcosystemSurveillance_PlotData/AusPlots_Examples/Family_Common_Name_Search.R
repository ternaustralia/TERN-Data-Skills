
#########################################################
############Family & Common Name Search of TERN Database Species######## 
#########################################################
#Authors:Samantha Munroe
#Updated: 30/11/2020

#TERN does not record the family or common name of any species in our database
#TERN records species data to the lowest possible taxonimic level (often genus-species, but can also include subsp.) 
#To group TERN records based on other taxonmic information (such as family, order, common name, etc)
#Collate a species list from the TERN database and search this list in the Atlas of Living Australia database (available via ALA4R)
#ALA4R is a package that includes taxonomic information for all Australian species, including plants.
#More details on ALA4R can be found at https://atlasoflivingaustralia.github.io/ALA4R/articles/ALA4R.html

#open most recent version of ausplotsR
install.packages(c("ausplotsR","ALA4R","rgbif"))

library(ausplotsR)

#Open additional libraries 
library(ALA4R)
library(tidyverse)
library(rgbif)

#import ausplots data
my.ausplots.data <- get_ausplots()
#get_ausplots() can be used to filter the species search list based on plots, areas, or species
#This example uses the entire ausplots species list

#extract all species names from TERN Database, this can be done using any ausplotsR dataframe that includes $herbarium_determination, in this case I am using veg.vouch
species_names<-my.ausplots.data$veg.vouch$herbarium_determination 

#reduce species list to only the unique species names in the database
species_names_1<-unique(species_names) 
#convert to a data.frame
species_names_1<-as.data.frame(species_names_1) 
names(species_names_1)[1]<-paste("herbarium_determination")

#format TERN species names for ALA4R search
species_names_1$herbarium_determination<-trimws(species_names_1$herbarium_determination)#remove leading and trailing white spaces
species_names_1$herbarium_determination <- capitalize(species_names_1$herbarium_determination)# capitilise first word
species_names_1[species_names_1==""]<-NA #replace any blank rows with NAs
species_names_1<-na.omit(species_names_1) #omit NAs

#extract genus for each species and create new genus column
species_names_1$genus <- word(species_names_1$herbarium_determination,1, sep = fixed(' ')) 

#create an empty column to save family search results
species_names_1$family <- NA
#create an empty column to save common name search results
species_names_1$common_name <- NA 

#search the species name to get the family
#for each unique genus, use ALA4R to extract the family
for(i in unique(species_names_1$genus)){
  si<-species_info(i)#retrieve taxa info for each unique genus
  species_names_1[which(species_names_1$genus == i),]$family<-si$classification$family
} # note that this loop can be modified to extract any relavent piece of species information available through ALA

#ALA will ID a lot of families, however, ALA doesn't have all taxonomic info for all genera
#names are always changing, which can cause issues
#Moreover, not every TERN entry will have a genus 
#some records are only indentified to the family or even growth form level
#in cases where no family is retrieved, the species_names_1$family row will be assigned NA
#to find which species could not be assigned a family, extract all the NAs in the family column

NA_families<- species_names_1[is.na(species_names_1$family),]
missing_names<-unique(NA_families$herbarium_determination)

# to fill in these gaps, use a second package called rgbif 
#this package is provided by the Global Biodiversity Information Facility ('GBIF'; <https://www.gbif.org/developer/summary>). 
#'GBIF' is a database of species occurrence records from sources all over the globe. 
#for each missing name, the correct family can be searched manually using the rgbif package
#for example

familiy_name<-name_backbone(name='Euryomytus', rank='genus', kingdom='plant')

#then the family can be added manually to the TERN species list
species_names_1[which(species_names_1$genus == "Euryomytus"),]$family<-"Myrtaceae"
#or
species_names_1[which(species_names_1$genus == "Euryomytus"),]$family<- familiy_name$family


#next use ALA to search for species common names
#for each unique species, use ALA4R to extract the common name
for(i in unique(species_names_1$herbarium_determination)){
  si<-species_info(i)#retrieve taxa info for each unique genus
  species_names_1[which(species_names_1$herbarium_determination == i),]$common_name<-si$commonNames$nameString[1] #extracts only the first common name provided by ALA
}
#Note that common names are often not available for plant species
#depending on the size of the species list, can also be a bit slow

#ALA will sometimes assign the scientific name as the common name if the actual common name is not known/recorded in the ALA database
#this could be confusing, so convert common names that are actually scientific names to NAs to indicate there is no known/recorded common name for that species
#in cases where common names and species names are indentical, convert common name to NA
species_names_1 <-  mutate(species_names_1,
            common_name = ifelse(herbarium_determination != common_name,
                                 yes =  common_name, 
                                no = NA))

#save the output
write.csv(species_names_1, file="species_names.csv")##

###END#####
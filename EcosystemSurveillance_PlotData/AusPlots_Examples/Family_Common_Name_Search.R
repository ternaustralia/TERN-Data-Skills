
#########################################################
############Family & Common Name Search of TERN Database Species######## 
#########################################################
#Authors:Samantha Munroe
#Updated: 30/11/2020

#TERN does not record the family or common name of any species in our database
#TERN records species data to the lowest possible taxonimic level (often genus-species, but can also include subsp.) 
#To group TERN records based on other taxonmic information (such as family, order, common name, etc)
#Collate a species list from the TERN database and search this list in the Atlas of Living Australia database (available via galah)
#galah is a package that includes taxonomic information for all Australian species, including plants.
#More details on galah can be found at https://atlasoflivingaustralia.github.io/galah/articles/galah.html

#open most recent version of ausplotsR
#install.packages(c("ausplotsR","galah","rgbif"))

library(ausplotsR)

#Open additional libraries 
library(galah)
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

#format TERN species names for galah search
species_names_1$herbarium_determination<-trimws(species_names_1$herbarium_determination)#remove leading and trailing white spaces
species_names_1$herbarium_determination <- str_to_sentence(species_names_1$herbarium_determination)# capitilise first word
species_names_1[species_names_1==""]<-NA #replace any blank rows with NAs
species_names_1<-na.omit(species_names_1) #omit NAs

#extract genus for each species and create new genus column
species_names_1$genus <- word(species_names_1$herbarium_determination,1, sep = fixed(' ')) 

#create an empty column to save family search results
species_names_1$family <- NA
#create an empty column to save common name search results
species_names_1 <- head(species_names_1)

#search the species name to get the family
#for each unique genus, use galah to extract the family
for(i in unique(species_names_1$genus)){
  galah_call() %>%
    galah_identify("plantae") %>%
    search_taxa(i) %>%
    as_tibble() %>%
    slice_tail(n = 1)-> si#retrieve taxa info for each unique genus
  species_names_1[which(species_names_1$genus == i),]$family<-si$family
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


#save the output
write.csv(species_names_1, file="species_names.csv")##

###END#####
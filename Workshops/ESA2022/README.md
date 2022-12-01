# ESA 2022 workshop: TERN infrastructure to enable submission and access to FAIR terrestrial ecosystem data 

This workshop is aimed at scientists, policy makers and data publishers and data enthusiasts interested in learning about data publication and accessing structured survey-based ecology data from TERN infrastructure.

The workshop is divided into two parts:

1) The first part of the workshop includes a hands-on tutorial and presentation on making terrestrial ecosystem data Findable, Accessible, Interoperable and Reusable (FAIR). The participants will learn about FAIR data principle and use of TERN SHaRED (https://shared.tern.org.au) to publish FAIR research data;

2) The second part of the workshop will showcase the use of EcoPlots (https://ecoplots.tern.org.au) to search and access ecological survey data (standardised parameters with descriptive information including units, definitions, and protocols) collected at TERN observatory sites and other partnering institutes. The EcoPlots harmonise ecology survey data from different sources to enable integrated search and access to data based across different jurisdictions, data sources, feature types (e.g., plant populations, animal individuals, dead wood), parameters, and temporal extent.
Participants are requested to bring their laptop with internet and updated RStudio to access SHaRED and run analysis code for data accessed from EcoPlots.

## Accessing the data


Option 1: 
To download ESA2022 material directly, visit DownGit (https://minhaskamal.github.io/DownGit) and use workshop material link (https://github.com/ternaustralia/TERN-Data-Skills/tree/master/Workshops/ESA2022) to download all workshop artefacts. Save the zip file into your computer and unzip the file to store in a single folder. All the data, code and markdown should be available in a newly created folder.


Alternatively, Clone the data, code and markdown from the TERN-Data_Skills github repository (https://github.com/ternaustralia/TERN-Data-Skills). This will clone the entire "TERN-Data-Skills" repository including all previous workshop materials.

Using your computer terminal, create a folder called "Ecoplot_ESA_2022"

```
mkdir Ecoplot_ESA_2022
```
Change to that directory

```
cd Ecoplot_ESA_2022
```

In the github repository, click the green "Code" button and clone the repository by copying the HTTPS address (https://github.com/ternaustralia/TERN-Data-Skills.git) 

### Clone the repository

```
git clone https://github.com/ternaustralia/TERN-Data-Skills.git

```



Option 2: Obtain the files from the instructor via a USB drive


## Opening the data in RStudio

Open RStudio, in the "Files" pane, naviagte to Ecoplots_ESA_2022 > TERN_Data_Skills > Workshops > ESA 2022 

The folder contains the following:

1. Biomass_ESA_2022 folder, which contains the data files that will be used in the workshop
2. ecoplots-example-ESA_2022.html, which is the R Markdown file.  This can be view on html by clicking on the file and selecting the "View in Web browser" option.
3. ecoplots-example-ESA_2022.Rmd, which contains the code used in the workshop.

### Set working directory

```
setwd("~/Ecoplot_ESA_2022/TERN-Data-Skills/Workshops/ESA 2022")
```

You can now follow the R markdown and run the examples.










setwd('YOUR_WORK_DIRECTORY_PATH')

library(sp)
library(sf)
library(raster)
library(dplyr)
library(terra)
library(remotes)
library(devtools)
library(Makurhini)

#Read in the habitat patch layer
Habitat_patch_polygons = st_read(dsn= '.' , layer="Habitat_patches")

#Print the number of rows in the dataset. The number of polygons dramatically changes the run time for the analysis along with the memory constraints.
nrow(rainforest_patches) # Number of patches

options(future.globals.maxSize=+Inf)

#Selecting patches over a certain size. In this example, 100 hectares is used.
Large_patches <- Habitat_patch_polygons %>% 
  filter(area_ha>=100)

nrow(Large_patches) # Number of patches

#Calculating the IIC 
IIC <- MK_dPCIIC(nodes = big_patches, 
                 attribute = NULL,
                 area_unit = "m2",
                 restoration = NULL,
                 distance = list(type= "edge"),
                 metric = "IIC", 
                 distance_thresholds = 10000,
                 parallel = 10,
                 write = './YOUR_OUTPUT_PATH/OUTPUT_LAYER_NAME') 
IIC





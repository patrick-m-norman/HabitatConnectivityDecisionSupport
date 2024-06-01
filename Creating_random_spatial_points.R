setwd('.')

library(sp)
library(dplyr)
library(tools)
library(rgdal)
library(magrittr)
library(dplyr)
library(sf)
library(purrr)
library(maptools)
library(rgeos)
library(tibble)


#loading shapefiles
file <- file_path_sans_ext(list.files(pattern = "\\Habitat_patches$"))
all_polygons <- st_read('.', file) 
all_polygons.proj <- CRS("+init=epsg:3112") 
all_polygons$sum <- as.integer(all_polygons$sum)


#Calculating half of the data
half_of_data <- nrow(all_polygons)/2

#Randomly sampling half of the polygons
Source_polys <- all_polygons[sample(1:nrow(all_polygons), half_of_data), ]

#Getting the data out of spatial polys to do an antijoin
all_polygons_df <- as.data.frame(all_polygons)
source_polygons_df <- as.data.frame(Source_polys)

Destination_polys_df <- all_polygons_df %>% anti_join(source_polygons_df,by="zone_id") 

#Now selecting only matching records
Destination_polys <- inner_join(all_polygons, Destination_polys_df, by='zone_id')

#Creating the source points
Source_points <- Source_polys %>% 
  st_sample(size = as.integer(.$sum/9000), exact = FALSE) %>% 
  as(., 'Spatial')

Source_points$long <- unlist(map(Source_points@coords[,1],1))
Source_points$latitude <- unlist(map(Source_points@coords[,2],1))

Source_points2 <- st_as_sf(Source_points, coords = c("long", "latitude"),crs = all_polygons.proj) %>% 
  st_join(Source_polys, join = st_intersects) %>% 
  aggregate(.["zone_id"], FUN = "first") %>% 
  as(., 'Spatial')

#Exporting the source points
writeOGR(obj=Source_points2, dsn='.', layer='Source_points', driver="ESRI Shapefile")
  

#Creating the destination points
Destination_points <- Destination_polys %>% 
  st_sample(size = as.integer(.$sum.x/9000), exact = FALSE) %>% 
  as(., 'Spatial')

Destination_points$long <- unlist(map(Destination_points@coords[,1],1))
Destination_points$latitude <- unlist(map(Destination_points@coords[,2],1))

Destination_points2 <- st_as_sf(Destination_points, coords = c("long", "latitude"),crs = all_polygons.proj) %>% 
  st_join(Destination_polys, join = st_intersects) %>% 
  aggregate(.["zone_id"], FUN = "first") %>% 
  as(., 'Spatial')

#Exporting the destination points
writeOGR(obj=Destination_points2, dsn='.', layer='Destination_points', driver="ESRI Shapefile")


# Title     : TODO
# Objective : TODO
# Created by: bkaso
# Created on: 08-Jan-21

source("C:/Users/bkaso/Documents/Projects/Programming/Geosptail R/Function.R")
B3 <- raster(imgs_b3[[32]])
B8 <- raster(imgs_b8[[32]])

img <- stack(B8,B3)

aoi <- crop(img, shape)

ndvi <- NDVI(aoi, 1,2)

x <- getValues(ndvi)


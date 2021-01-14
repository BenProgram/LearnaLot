# Title     : TODO
# Objective : TODO
# Created by: bkaso
# Created on: 08-Jan-21

library(raster)

imgs_b8 <- list.files("C:/Users/bkaso/Documents/Students/Honours Projects 2019/Sisipho Gebe/Data research", pattern = "8_10m.jp2$",
                      full.names = T)
imgs_b3 <- list.files("C:/Users/bkaso/Documents/Students/Honours Projects 2019/Sisipho Gebe/Data research", pattern = "3_10m.jp2$",
                      full.names = T)
shape <- shapefile("C:/Users/bkaso/Documents/Students/Honours Projects 2019/Sisipho Gebe/Data research/kat.shp")

NDVI <- function (img, k,i){
  ind <- (img[[k]]-img[[i]])/(img[[k]]+img[[i]])
  return (ind)
}
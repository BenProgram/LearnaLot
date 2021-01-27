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

climate <- read.delim("C:/Users/bkaso/Documents/Students/Honours Projects 2019/Rosebud/climate.txt", header = T, sep = "\t", dec = ".")

NDVI <- function (img, k,i){
  ind <- (img[[k]]-img[[i]])/(img[[k]]+img[[i]])
  return (ind)
}

Sarea <- function(x){
  water <- 0
  bs <- 0
  veg <- 0
  for (i in 1:length(x)){
    if(x[i] <= 0) {
      water <- water + 1
    } else if(x[i] > 0 && x[i] <= 0.4)
  {
bs <- bs +1
}else{
veg <- veg + 1
}
  }
surface <- as.data.frame(cbind(water,bs,veg))
  return (surface)

}
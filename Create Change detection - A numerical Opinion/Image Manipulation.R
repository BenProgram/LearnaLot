# Title     : TODO
# Objective : TODO
# Created by: bkaso
# Created on: 08-Jan-21

source("C:/Users/bkaso/Documents/Projects/Programming/Geospatial R/Function.R")

for( i in 1:32){
  if(i ==1){
       B3 <- crop(raster(imgs_b3[i]), shape)
    B8 <- crop(raster(imgs_b8[i]), shape)
  }else{
    B3 <- stack(B3,crop(raster(imgs_b3[i]), shape))
    B8 <- stack(B8,crop(raster(imgs_b8[i]), shape))
  }
}
img <- stack(B3,B8)

for(i in 1:32){
  if (i == 1){
    ndvi <- NDVI(img,i+32,i)
  }else{
    ndvi <- stack(ndvi,NDVI(img,i+32,i))
  }
}

for( i in 1:32){
  if (i == 1){
    trends <-  getValues(ndvi[[i]])[!is.na(getValues(ndvi[[i]]))]
  }else{
    trends <- cbind(trends, getValues(ndvi[[i]])[!is.na(getValues(ndvi[[i]]))])
  }
}

for(i in 1:ncol(trends)){
  if (i == 1){
dt <- Sarea(trends[,i])
  }else{
    dt <- rbind(dt, Sarea(trends[,i]))
  }
}

dta <- as.matrix(dt)

barplot(t(dta/10000),
        main = "Change detection - a Numerical point of View",
        xlab = "Coverage",
        col = c("Blue", "Brown", "Green"),
        beside = T)

clim <- climate[140:171,1:4]

dat <- cbind(as.data.frame(dta), clim)

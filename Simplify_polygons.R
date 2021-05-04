library(rgdal);library(raster);library(rgeos)

wd_in <- "C:/Users/ca13kute/Documents/Yendé/Intersect_EEZ_IHO_v4_2020"
wd_out <- "C:/Users/ca13kute/Documents/Yendé/Intesect_EEZ_IHO_v4_2020_Simplified"

simplifyPolygons <- function(wd_in, wd_out, tol){
  setwd(wd_in)
  name <- gsub(".shp","",list.files(pattern = ".shp$"))
  shp <- readOGR(name,dsn = wd_in)
  shp_simp <- gSimplify(shp,tol,topologyPreserve = TRUE)
  shp_simp <- SpatialPolygonsDataFrame(shp_simp,shp@data)
}

tol=1

plot(shp[60,])
plot(shp_simp[60,])


russia <- shp[which(shp$SOVEREIGN1 == "Russia"),]
russia2 <- shp_simp[which(shp_simp$SOVEREIGN1 == "Russia"),]

i=7
plot(russia[i,],border=NA,col="green")
plot(russia2[i,],add=T)

test <- russia[i,]
test2 <- gSimplify(test,tol=1,topologyPreserve = T)
  
plot(test,add=F)
plot(test2,add=T,col="green")
  
tol= 0.2

t <- readOGR("Intersect_EEZ_IHO_v4_2020", dsn = wd)

plot(t[1,])


wd <- "C:/Users/ca13kute/Documents/2nd_Chapter/Fresh_water/FreshWater_shp"
wd_out <- "C:/Users/ca13kute/Documents/2nd_Chapter/Fresh_water/Simplified_FreshWater_shp"

shp <- readOGR("Basin042017_3119",dsn=wd)

shp2 <- gSimplify(shp,0.05,topologyPreserve = T)
shp3 <- SpatialPolygonsDataFrame(shp2,shp@data)

writeOGR(shp3,dsn=wd_out,driver = "ESRI Shapefile", layer = "Basin042017_3119")

plot(shp[60,])
plot(shp3[60,])


shp3@data

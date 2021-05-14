library(rgdal);library(raster);library(rgeos)

wd_in <- "C:/Users/ca13kute/Documents/Yendé/Intersect_EEZ_IHO_v4_2020"
wd_out <- "C:/Users/ca13kute/Documents/Yendé/Intesect_EEZ_IHO_v4_2020_Simplified"
tol <- 0.1

simplifyPolygons <- function(wd_in, wd_out, tol){
  setwd(wd_in)
  name <- gsub(".shp","",list.files(pattern = ".shp$"))
  shp <- readOGR(name,dsn = wd_in)
  shp_simp <- gSimplify(shp,tol,topologyPreserve = TRUE)
  shp_simp <- SpatialPolygonsDataFrame(shp_simp,shp@data)
  writeOGR(shp_simp,dsn=wd_out,driver="ESRI Shapefile",layer="Simplified_regions")
}
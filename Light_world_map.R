library(rworldmap);library(rgdal);library(raster);library(rgeos)

wd_map_stuff <- "C:/Users/ca13kute/Dropbox/sTWIST/Files"
wd_world <- "C:/Users/ca13kute/Documents/Soup/World_simple_map"

world <- getMap(res="low")

world_simp <- gUnaryUnion(world)

world_simp$data <- NA

# Load world map frame and continent outline
setwd(wd_map_stuff)

world <- readRDS("wrld.rds")
worldmapframe <- readRDS("Worldmapframe.rds")

# reproject everythign to Eckert
worldmapframe <- spTransform(worldmapframe,CRS(proj4string(world)))
#I get warning messages here, but things keep working!
world_simp <- spTransform(world_simp,CRS(proj4string(world)))
#same!

#save simplified world map and frame
setwd(wd_world)
saveRDS(world_simp,"Simple_world")
saveRDS(worldmapframe,"World_frame")

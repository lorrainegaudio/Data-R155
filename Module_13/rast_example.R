## **First Install R Packages: 'terra', 'tidyterra', 'tigris'
library(terra)
library(tidyverse)
library(sf)
library(tidyterra)
library(tigris)


whp_idaho <- rast("C:/Users/Eva Lorraine Gaudio/OneDrive/Documents/BSU/Teaching/Data-R155/Data-R155/Module_13/whp_id.tif") ## replace with the path to your datafile


state_bounds <- states() %>% ## download state cartographic boundaries form the TIGER shapefiles
  filter(STUSPS %in% c("ID")) %>% ##filter for the ID state boundary
  st_transform(., crs = crs(whp_idaho)) ## reproject to the raster projection



plot_whp <- ggplot() + #open the ggplot environment
  geom_spatraster(data = whp_idaho, mapping = aes(fill = WHP_ID)) + #use tidyterra to convert the data to an object that can be used in the geom
  geom_sf(data = state_bounds, fill = "transparent", color = "red", lwd = 2) + #add the state boundaries
  scale_fill_viridis_c(option = "C", na.value = "transparent") + #change the colorramp for the data and plot NA as transparent
  theme_bw() #use a nicer theme
plot_whp

# a raster of wildfire hazard potential for Idaho

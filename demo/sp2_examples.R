# bpy.colors.R AAA.R Class-CRS.R CRS-methods.R 
# Class-Spatial.R Spatial-methods.R projected.R Class-SpatialPoints.R
# SpatialPoints-methods.R Class-SpatialPointsDataFrame.R
# SpatialPointsDataFrame-methods.R 


xx <- data_frame(x = runif(100, -10, 100), y = runif(100, -200, 10),  z = rnorm(100, 10))
d <- new("SpatialPoints", coords = xx, bbox = bbox(xx),
    proj4string = CRS(NA_character_))


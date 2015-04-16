# bpy.colors.R AAA.R Class-CRS.R CRS-methods.R 
# Class-Spatial.R Spatial-methods.R projected.R Class-SpatialPoints.R
# SpatialPoints-methods.R Class-SpatialPointsDataFrame.R
# SpatialPointsDataFrame-methods.R 


library(dplyr)
source("R/AAA.R")
source("R/Class-CRS.R")
source("R/CRS-methods.R")
source("R/Class-Spatial.R")
source("R/Spatial-methods.R")
source("R/projected.R")
source("R/Class-SpatialPoints.R")
source("R/SpatialPoints-methods.R")
source("R/Class-SpatialPointsDataFrame.R")
source("R/SpatialPointsDataFrame-methods.R")

xx <- data_frame(x = runif(100, -10, 100), y = runif(100, -200, 10),  z = rnorm(100, 10))
d <- new("SpatialPoints", coords = xx, bbox = bbox(xx),
    proj4string = CRS("+proj=laea"))

## this is where the @data becomes prime
df <- SpatialPointsDataFrame(d, as_data_frame(as.data.frame(d)))

## each row in @data points to a set of the vertices in @coords

geom_link <- as.list(seq(nrow(df)))

dat <- as_data_frame(as.data.frame(d))
dat$Geom__ <- geom_link

df <- SpatialPointsDataFrame(d, dat)

setClass("LINES", contains = "Spatial", 
         slots = c(coords = "tbl_df", data = "tbl_df"), 
         prototype = list(bbox = matrix(NA),
                          proj4string = CRS(NA_character_),
                          coords = data_frame(), data = data_frame()), 
         validity = function(object) {
            if (!is.list(object$Geom__)) stop("data frame has no Geom link")
           lens <- sapply(object$Geom, length)
           if (!all(lens > 1)) stop("Geom link contains non-line segments")
           TRUE
         })


## needs work obviously
geom_link <- as.list(as.data.frame(t(data_frame(seq(nrow(df))[-nrow(df)], seq(nrow(df))[-1]))))

dat <- as_data_frame(as.data.frame(d))[-nrow(d)]
dat$Geom__ <- geom_link
new("LINES", coords = xx, data = dat, bbox = bbox(xx))



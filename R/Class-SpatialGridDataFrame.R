setClass("SpatialPixelsDataFrame",
	contains = c("SpatialPixels", "SpatialPointsDataFrame"),
	slots = c(data = "ANY", coords.nrs = "numeric"),
	validity = function(object) {
		if (length(object@grid.index) != nrow(object@data))
			return("grid.index should have length equal to data slot")
		if (nrow(object@coords) != nrow(object@data))
			return("unequal number of objects in points and data frame")
		return(TRUE)
	}
)

setClass("SpatialGridDataFrame",
	contains = "SpatialGrid",
	slots = c(data = "ANY"),
	validity = function(object) {
	  if (!.canbedf(object@data)) stop("data should be or extend a data.frame")
		if (.NumberOfCells(object@grid) != nrow(object@data))
			return("unequal number of objects in full grid and data slot")
		return(TRUE)
	}
)

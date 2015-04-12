setClass("SpatialPolygonsDataFrame",
	contains = "SpatialPolygons", 
	slots = c(data = "ANY"),
	validity = function(object) {
	  if (!.canbedf(object@data)) stop("data should be or extend a data.frame")
		if (nrow(object@data) != length(object@polygons))
		  stop("number of rows in data.frame and polygons in SpatialPolygons don't match")
		return(TRUE)
	}
)


setClass("SpatialPolygonsDataFrame",
	contains = "SpatialPolygons",
	slots = c(data = "maybeDF"),
	validity = function(object) {
		if (nrow(object@data) != length(object@polygons))
		  stop("number of rows in data.frame and polygons in SpatialPolygons don't match")
		return(TRUE)
	}
)



setClass("SpatialLinesDataFrame",
	contains = "SpatialLines", 
	slots = c(data = "ANY"),
	validity = function(object) {
		if (!.canbedf(object@data)) stop("data should be or extend a data.frame")
		if (nrow(object@data) != length(object@lines))
		  stop("number of rows in data frame and SpatialLines don't match")
		return(TRUE)
	}
)

as.SpatialLines.SLDF <- function(SLDF) SpatialLines(SLDF@lines)

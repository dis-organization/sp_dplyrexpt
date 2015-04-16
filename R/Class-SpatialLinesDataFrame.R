
setClass("SpatialLinesDataFrame",
	contains = "SpatialLines",
	slots = c(data = "maybeDF"),
	validity = function(object) {
		if (nrow(object@data) != length(object@lines))
		  stop("number of rows in data frame and SpatialLines don't match")
		return(TRUE)
	}
)

as.SpatialLines.SLDF <- function(SLDF) SpatialLines(SLDF@lines)

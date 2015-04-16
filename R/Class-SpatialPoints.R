

setOldClass("tbl_df")
setClassUnion("maybeDF", c("tbl_df", "data.frame"))

setClass("SpatialPoints",
	contains = "Spatial",
	slots = c(coords = "tbl_df"),
	prototype = list(bbox = matrix(NA),
		proj4string = CRS(as.character(NA)),
		coords = "tbl_df"),
	validity = function(object) {
		if (ncol(object@coords) < 2)
			return("SpatialPoints: too few coordinate columns")
		if (!all(sapply(object@coords, is.double)))
			return("coordinates should be double")
		return(TRUE)
	}
)

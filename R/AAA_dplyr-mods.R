## sp with dplyr MDS

## internal function "can be a data frame" .canbedf 
## modified
# "Class-SpatialPolygonsDataFrame.R"
# "Class-SpatialPointsDataFrame.R"
# "Class-SpatialLinesDataFrame.R"
# "Class-SpatialGridDataFrame.R"
# "SpatialPointsDataFrame-methods.R"
##with if (!.canbedf(object@data)) stop("data should be or extend a data.frame")

## change from data.frame to ANY in 
# "SpatialPointsDataFrame-methods.R"
#setReplaceMethod("coordinates", signature(object = "ANY", value = "ANY"),
#                 function(object, value) {
     
              
setMethod("coordinates", "ANY", function(obj)coordinates(as.matrix(obj)) )

setMethod("as_data_frame", "Spatial", function(x) as_data_frame(as.data.frame(x)))

## in code examples in intro_sp_dplyr.R
##added %>% as_data_frame



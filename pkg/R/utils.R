get_exhibit <- function(name) {
  o <- load(file.path('../pkg/inst/exhibits', paste0(name, '.rda')))
  get(o)
}

map_values <- function(x, df, exhibit) {
  id_of <- exhibit$idof(x)
  if(length(id_of > 0) )
    return(df$fill[match(id_of, df$tissue)])
  else
    return("#FFFFFF")
}

setMethod("mapcols", "PictureFill", function(object, df, exhibit, ...) {
  pathGrob(object@x, object@y,
           default.units="native",
           gp=gpar(col=NA, fill=map_values(object@rgb, df, exhibit)), ...)
})

setMethod("mapcols", "PictureStroke", function(object, df, exhibit, ...) {
  polylineGrob(object@x, object@y,
               default.units="native",
               gp=gpar(col="#000000"), ...)
})


#' @export
get_exhibits <- function(names) {
  if(missing(names)) {
    names <- list.files(system.file('exhibits', package='ggefp'),
                        pattern='\\.rda$')
    names <- gsub('.rda$', '', names)
  }
  res <- lapply(names, function(n)
                 get(load(file.path(system.file('exhibits',
                                                paste0(n, '.rda'),
                                                package='ggefp')))))
  if(length(res) == 1) res <- res[[1]]
  res
}

map_values <- function(rgb, df, exhibit) {
  tissue_name <- exhibit$idof(rgb)
  if(length(tissue_name > 0) )
     return(df$fill[match(tissue_name, df$tissue)])
  else
    return("#FFFFFF")
}

#' @importClassesFrom grImport PictureFill
setMethod("mapcols", "PictureFill", function(object, df, exhibit, ...) {
  pathGrob(object@x, object@y,
           default.units="native",
           gp=gpar(col=NA, fill=map_values(object@rgb, df, exhibit)), ...)
})

#' @importClassesFrom grImport PictureStroke
setMethod("mapcols", "PictureStroke", function(object, df, exhibit, ...) {
  polylineGrob(object@x, object@y,
               default.units="native",
               gp=gpar(col="#000000"), ...)
})


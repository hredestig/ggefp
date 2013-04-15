#' Tissue map, line drawing with filled regions
#'
#' Line drawing 
#' @param mapping ehm
#' @param data the data
#' @param stat a statistic, not needed?
#' @param position not needed?
#' @param ... other params
#' @return a geom
#' @export
#' @import proto
#' @import grid
#' @importFrom grImport pictureGrob
#' @author Henning Redestig
geom_efp <- function(mapping=NULL, data=NULL,
                     collection, 
                     stat="identity",
                     position="identity", ...) { 

  stopifnot(is.data.frame(collection))
  if(is.null(collection$width)) collection$width  <- 1
  if(is.null(collection$height)) collection$height  <- 1
  if(is.null(collection$exhibit))
    collection$exhibit  <- 'ath_seedling'
  stopifnot(all(c("x", "y", "exhibit") %in% names(collection)))
  GeomEfp$new(geom_params=list(collection=collection, ...),
             mapping=mapping,  data=data, stat=stat, ...)
}

GeomEfp <- proto(ggplot2:::GeomPolygon, {
  objname <- "efp"

  draw_groups <- function(., data, scales, coordinates, collection) {
    coords <- coord_munch(coordinates, collection, scales)
    coords$group <- coords$group %||% coords$id
    efp_grob(collection, data)
  }
  required_aes <- c("tissue", "fill")

})

#' @export
efp_grob_single <- function(cl, data) {
  exhibit_file <-
    file.path(system.file('exhibits',
                          paste0(cl$exhibit, '.rda'),
                          package='ggefp'))
  stopifnot(nrow(cl) == 1)
  exhibit <- get_exhibits(cl$exhibit)
  grImport::pictureGrob(exhibit$img, cl$x, cl$y,
                        cl$width, cl$height, FUN=mapcols,
                        df=data, exhibit=exhibit)
}

#' @export
efp_grob <- function(collection, data) {
  grob_list <- dlply(collection, 'exhibit', efp_grob_single, data)
  do.call('gList', grob_list)
}

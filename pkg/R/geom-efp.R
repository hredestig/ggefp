#' @import plyr
#' @import proto
#' @import grid
NULL

#' Filled paths from locally stored vector graphics
#'
#' When using \code{geom_efp}, you will typically need two data
#' frames: one contains the coordinates of each exhibit (positions),
#' and the other the values associated with each tissue (values). The
#' tissue links the data values to the regions defined in each
#' exhibit.
#'
#' Required aesthetics are \code{fill} and \code{tissue}
#' @param collection Data frame that contains the exhibit
#' coordinates. Must contain the elements \code{exhibit} which
#' specifies name of the stored exhibit to plot or be a path to an
#' exhibit stored outside the package, \code{x} and \code{y} to
#' specify where to draw the exhibit. May also specify \code{width}
#' and \code{height} to decide the size of the exhibit.
#' @param mapping as provided by using \code{aes}
#' @param data the data provided as a data frame
#' @param stat the stat to plot
#' @param position not needed
#' @param ... passed on to creation of the prototype
#' @export
#' @author Henning Redestig
#' @examples
#' values <- data.frame(tissue=c('cotelydons', 'root', 'hypocotyl'),
#'                      value=c(1,1000,200))
#' 
#' collection <- data.frame(exhibit='ath_seedling', x=.5, y=.5)
#' ggplot(values, aes(tissue=tissue, fill=value)) +
#'   geom_efp(collection) + 
#'   expand_limits(collection) + xlim(0,1) + ylim(0,1)
#' 
#' values <-
#'   data.frame(tissue=rep(c('leaf6', 'cotelydons', 'root', 'hypocotyl'), 2),
#'              value=c(1,1000,200,20, 1100, 40,60,900),
#'              treatment=rep(c('control', 'cold'), each=4))
#' collection <- data.frame(exhibit=c('ath_seedling', 'ath_leaf6'),
#'                          x=c(.5, .2), y=c(.5, .3),
#'                          width=c(1,.3), height=c(1,.3))
#' ggplot(values, aes(tissue=tissue, fill=value)) +
#'   geom_efp(collection) +
#'   facet_wrap(~treatment) + expand_limits(collection) +
#'   xlim(0,1) + ylim(0,1) + theme_efp()
geom_efp <- function(collection, 
                     mapping=NULL, data=NULL,
                     stat="identity",
                     position="identity", ...) { 

  stopifnot(is.data.frame(collection))
  if(is.null(collection$width)) collection$width  <- 1
  if(is.null(collection$height)) collection$height  <- 1
  if(is.null(collection$exhibit))
    collection$exhibit  <- 'ath_seedling'
  stopifnot(all(c('x', 'y', 'exhibit') %in% names(collection)))
  GeomEfp$new(geom_params=list(collection=collection, ...),
             mapping=mapping,  data=data, stat=stat, ...)
}

GeomEfp <- proto(ggplot2:::GeomMap, {
  objname <- 'efp'
  draw_groups <- function(., data, scales, coordinates, collection) {
    coords <- coord_munch(coordinates, collection, scales)
    ggefp:::efp_grob(coords, data)
  }
  required_aes <- c('tissue', 'fill')
})

efp_grob_single <- function(cl, data) {
  exhibit_file <-
    file.path(system.file('exhibits',
                          paste0(cl$exhibit, '.rda'),
                          package='ggefp'))
  
  stopifnot(nrow(cl) == 1)
  exhibit <- get_exhibit(cl$exhibit)
  grImport::pictureGrob(exhibit$img, cl$x, cl$y,
                        cl$width, cl$height, FUN=mapcols,
                        df=data, exhibit=exhibit)
}

efp_grob <- function(collection, data) {
  grob_list <- dlply(collection, 'exhibit',
                     ggefp:::efp_grob_single, data)
  do.call('gList', grob_list)
}


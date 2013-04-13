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
geom_efp <- function(collection, mapping=NULL, data=NULL,
                     stat="identity",
                     position="identity", ...) { 
  GeomEfp$new(mapping=mapping, data=data,
              collection=collection,
              stat=stat, position=position, ...)
}

GeomEfp <- proto(ggplot2:::Geom, {
  objname <- "polygon"
  draw_groups <- function(., ...) .$draw(...)

  draw <- function(., data, scales, coordinates,
                   collection, ...) { 
    
    pic_grobs <- lapply(collection, function(e) {
      fp <-
        file.path(system.file('exhibits', paste0(e$exhibit, '.rda'),
                              package='ggefp'))
      e$exhibit <- get(load(fp))
      e$df <- data
      e$picture <- e$exhibit$img
      e$FUN <- mapcols
      do.call(grImport::pictureGrob, e)
    })
    
    ggname(.$my_name(),
           gTree(children=do.call('gList', pic_grobs)))
  }


  default_stat <- function(.) StatIdentity
  default_aes <- function(.) aes(x=.5, y=.5)
  required_aes <- c("fill", "tissue")
  guide_geom <- function(.) "polygon"

  draw_legend <- function(., data, ...)  {
    data <- aesdefaults(data, .$default_aes(), list(...))
    with(data, grobTree(
      rectGrob(gp=gpar(col=colour, fill=alpha(fill, alpha),
                 lty=linetype))
    ))
  }
})


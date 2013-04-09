#' Tissue map, line drawing with filled regions
#'
#' Line drawing 
#' @param mapping ehm
#' @param data the data
#' @param stat a statistic, not needed?
#' @param position not needed?
#' @param ... other params
#' @return a geom
#' @author Henning Redestig
geom_efp <- function(mapping=NULL, data=NULL, collection=NULL, stat="identity",
                     position="identity", ...) { 
  GeomEfp$new(mapping=mapping, data=data, collection=collection, stat=stat,
              position=position, ...)
}

GeomEfp <- proto(ggplot2:::Geom, {
  objname <- "polygon"

  draw_groups <- function(., ...) .$draw(...)

  draw <- function(., data, scales, coordinates, ...) {
    ggname(.$my_name(),
           gTree(children=gList(
                   pictureGrob(small_plant$img, .5, .5,
                               FUN=mapcols, df=data)
                   )))
  }

  exhibits <- function(.) {
    lapply(.$collection$exhibits, function(n) {
      o <- load(system.file(file.path('inst', 'exhibits', paste0(n, '.rda'))))
      get(o)
    })
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


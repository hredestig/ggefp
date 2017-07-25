#' BaseExhibit
#'
#' exhibits should inherit from this
#' @format a ggproto class
#' @docType data
#' @export
BaseExhibit <-
  ggproto(img=NULL, desc=NULL, key=data.frame(),
          what='ggefp-exhibit',
          draw=function(self, ...) grid.picture(self$img, ...),
          idof=function(self, x) {
            self$key$tissue[self$key$id == x]
          },
          pprint=function(self) {
            cat(sprintf('%s\n', self$desc))
          })

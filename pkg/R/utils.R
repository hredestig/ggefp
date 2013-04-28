get_exhibit <- function(name) {
  if(inherits(name, 'proto'))
    return(name)
  name <- as.character(name)
  if(exists(name) && inherits(get(name), 'proto'))
    return(get(name))
  name <- as.character(name)
  pkg_path <- system.file('exhibits', paste(name, '.rda', sep=''),
                          package='ggefp')
  if(!file.exists(name) & file.exists(pkg_path))
    name <- pkg_path
  if(!file.exists(name) & !file.exists(pkg_path))
    stop('unknown exhibit ', name)
  res <- get(load(file.path(name)))
  if(is.null(res$key))
    stop(name, ' does not look like a ggefp exhibit')
  res
}

#' List available exhibits
#'
#' An exhibit here is a line drawing with regions annotated as being
#' speciific tissues that can be used to visualize data in a
#' contextual map. 
#' @return a data frame describing the exhibits provided in this
#' package
#' @examples
#' exhibits()
#' @export
#' @author Henning Redestig
exhibits <- function() {
  names <- list.files(system.file('exhibits', package='ggefp'),
                      pattern='\\.rda$')
  names <- gsub('.rda$', '', names)
  from_package <- ldply(names, function(n) {
    ex <- get_exhibit(n)
    data.frame(exhibit=n, tissue=ex$key$tissue, from=.pkg)
  })
  names <- Filter(function(x) inherits(get(x), 'proto') &&
                  get(x)$what == 'ggefp-exhibit' &&
                  !is.null(get(x)$img), ls(.GlobalEnv))
  from_global <- ldply(names, function(n) {
    ex <- get_exhibit(n)
    data.frame(exhibit=n, tissue=ex$key$tissue, from='global')
  })
  rbind(from_package, from_global)
}

map_values <- function(rgb, df, exhibit) {
  tissue_name <- exhibit$idof(rgb)
  ifelse(length(tissue_name > 0),
         df$fill[match(tissue_name, df$tissue)],
         NA)
}

#' @importFrom grImport grobify
do_mapgrobify <- function(object, df, exhibit, labels=TRUE, ...) {
  if('rgb' %in% slotNames(object)) {
     new_rgb <- map_values(object@rgb, df, exhibit)
    if(!is.na(new_rgb))
      object@rgb <- map_values(object@rgb, df, exhibit)
   }
  grobify(object, ...)
}

#' @importClassesFrom grImport PictureFill
setMethod("mapgrobify", "PictureFill", do_mapgrobify)
#' @importClassesFrom grImport PictureStroke
setMethod("mapgrobify", "PictureStroke", do_mapgrobify)
setMethod("mapgrobify", "PictureText", function(object, df, exhibit, labels=TRUE, ...) {
  if(labels) do_mapgrobify(object, df, exhibit, ...)
})
          

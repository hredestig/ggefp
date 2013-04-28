#' Arabidopsis developmental map
#'
#' @aliases ath_developmental_map
#' @format a data frame
#' @docType dataset
#' @references Provided by Nicholas Provart
#' \url{http://bar.utoronto.ca/efp/cgi-bin/efpWeb.cgi}
#' @export
ath_developmental_map <-
  data.frame(exhibit=c('ath_mature_plant', 'ath_young_plant',
               'ath_leaf_series', 
               'ath_flower_series', 'ath_seedling',
               'ath_seed_series', 'ath_shoot_apex',
               'ath_dormant_seeds'),
             x=c(.1, .27, .65, .6, .27, .7,.33, .20),
             y=c(.5, .4, .4, .1, .65, .8, .9, .2),
             width=c(.3, .3, .7, .8, .17, .6, .3, .2),
             height=c(1, .3, .7, .8, .17, .6, .3,.2))

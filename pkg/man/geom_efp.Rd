\name{geom_efp}
\alias{geom_efp}
\title{Filled paths from locally stored vector graphics}
\usage{
  geom_efp(collection, mapping = NULL, data = NULL,
    stat = "identity", position = "identity", ...)
}
\arguments{
  \item{collection}{Data frame that contains the exhibit
  coordinates. Must contain the elements \code{exhibit}
  which specifies name of the stored exhibit to plot or be
  a path to an exhibit stored outside the package, \code{x}
  and \code{y} to specify where to draw the exhibit. May
  also specify \code{width} and \code{height} to decide the
  size of the exhibit.}

  \item{mapping}{as provided by using \code{aes}}

  \item{data}{the data provided as a data frame}

  \item{stat}{the stat to plot}

  \item{position}{not needed}

  \item{...}{passed on to creation of the prototype}
}
\description{
  When using \code{geom_efp}, you will typically need two
  data frames: one contains the coordinates of each exhibit
  (positions), and the other the values associated with
  each tissue (values). The tissue links the data values to
  the regions defined in each exhibit.
}
\details{
  Required aesthetics are \code{fill} and \code{tissue}
}
\examples{
values <- data.frame(tissue=c('cotelydons', 'root', 'hypocotyl'),
                     value=c(1,1000,200))

collection <- data.frame(exhibit='ath_seedling', x=.5, y=.5)
ggplot(values, aes(tissue=tissue, fill=value)) +
  geom_efp(collection) +
  expand_limits(collection) + xlim(0,1) + ylim(0,1)

values <-
  data.frame(tissue=rep(c('leaf6', 'cotelydons', 'root', 'hypocotyl'), 2),
             value=c(1,1000,200,20, 1100, 40,60,900),
             treatment=rep(c('control', 'cold'), each=4))
collection <- data.frame(exhibit=c('ath_seedling', 'ath_leaf6'),
                         x=c(.5, .2), y=c(.5, .3),
                         width=c(1,.3), height=c(1,.3))
ggplot(values, aes(tissue=tissue, fill=value)) +
  geom_efp(collection) +
  facet_wrap(~treatment) + expand_limits(collection) +
  xlim(0,1) + ylim(0,1)
}
\author{
  Henning Redestig
}


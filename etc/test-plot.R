library(ggefp)
dd <- data.frame(tissue=rep(c('leaf6', 'cotelydons', 'root', 'hypocotyl'), 2),
                 value=c(1,1000,200,20, 1100, 40,60,900),
                 treatment=rep(c('control', 'cold'), each=4))

clct <- list(list(exhibit='ath_seedling', x=.5, y=.5),
             list(exhibit='ath_leaf6', x=.2, y=.2, width=.3, height=.4))

clct <- data.frame(exhibit=c('ath_seedling', 'ath_leaf6'),
                   x=c(.5, .2), y=c(.5, .3),
                   width=c(1,.3), height=c(1,.2))
                   
ggplot(dd) + geom_efp(collection=clct, aes(tissue=tissue, fill=value)) +
  facet_wrap(~treatment) + expand_limits(clct)

ggplot(dd, aes(tissue=tissue, x=.5, y=.5, fill=value)) + geom_efp(clct) +
  facet_wrap(~treatment)

ggplot(dd, aes(x=.5, y=.5, tissue=tissue, fill=value)) + 
  geom_efp(clct) +
  facet_wrap(~treatment) + theme_efp()

dd <- subset(dd, treatment == 'control')

ggplot(dd, aes(x=.5, y=.5, tissue=tissue, fill=value)) +
  geom_efp(clct) + theme_efp()





ids <- factor(c("1.1", "2.1", "1.2", "2.2", "1.3", "2.3"))
values <- data.frame(id=ids, value=c(3, 3.1, 3.1, 3.2, 3.15, 3.5))
positions <- data.frame(id=rep(ids, each=4),
  x=c(2, 1, 1.1, 2.2, 1, 0, 0.3, 1.1, 2.2, 1.1, 1.2, 2.5, 1.1, 0.3,
    0.5, 1.2, 2.5, 1.2, 1.3, 2.7, 1.2, 0.5, 0.6, 1.3),
  y=c(-0.5, 0, 1, 0.5, 0, 0.5, 1.5, 1, 0.5, 1, 2.1, 1.7, 1, 1.5,
    2.2, 2.1, 1.7, 2.1, 3.2, 2.8, 2.1, 2.2, 3.3, 3.2))

ggplot(values) + geom_map(aes(map_id=id), map=positions)  +
  expand_limits(positions)

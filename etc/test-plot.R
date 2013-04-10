dd <- data.frame(tissue=rep(c('leaf6', 'cotelydons', 'root', 'hypocotyl'), 2),
                 value=c(1,1000,200,20, 1100, 40,60,900),
                 treatment=rep(c('control', 'cold'), each=4))

clct <- list(list(exhibit='ara_seedling', x=.5, y=.5))

ggplot(dd, aes(x=.5, y=.5, tissue=tissue, fill=value)) +
  geom_efp(clct) +
  facet_wrap(~treatment) + theme_efp()

dd <- data.frame(tissue=c('cotelydons', 'root', 'hypocotyl'),
                 value=c(10,1000,200))

ggplot(dd, aes(x=.5, y=.5, tissue=tissue, fill=value)) +
  geom_efp(clct) + theme_efp()

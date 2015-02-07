library(ggefp)

collection <- data.frame(exhibit=c('ath_seedling', 'ath_young_plant'),
                 x=c(.2, .7), y=c(.5, .5), width=c(.4,.6), height=c(1,1))

values <-
  data.frame(tissue=rep(c('hypocotyl', 'young-root', 'cotelydons',
               'vegetative-rosette', 'root'), 2),
             value=c(3000, 2000, 20, 20, 1100, 1, 40, 60, 900, 10),
             treatment=rep(c('control', 'cold'), each=5))

ggplot(values, aes(tissue=tissue, fill=ifelse(value > 1000, 1000, value))) +
  geom_efp(collection) +
  facet_wrap(~treatment) +
  expand_limits(collection) +
  xlim(0,1) + ylim(0,1) + theme_efp() +
  scale_fill_continuous(name="thresholded value")

dd <- data.frame(tissue=exhibits()$tissue)
dd$val <- abs(rnorm(nrow(dd),sd=40))

ggplot(dd, aes(tissue=tissue, fill=val)) +
  geom_efp(ath_developmental_map) +
  expand_limits(ath_developmental_map) + 
  xlim(0,1) + ylim(0,1)



      





dd <- data.frame(tissue=rep(c('leaf6', 'cotelydons', 'root',
                   'hypocotyl'), 2),
                 value=c(1,1000,200,20, 1100, 40,60,900),
                 treatment=rep(c('control', 'cold'), each=4))

clct <- data.frame(exhibit=c('ath_seedling', 'ath_leaf6'),
                   x=c(.5, .2), y=c(.5, .3),
                   width=c(1,.3), height=c(1,.3))
                   
ggplot(dd, aes(tissue=tissue, fill=value)) +
  geom_efp(clct) +
  facet_wrap(~treatment) + expand_limits(clct) +
  xlim(0,1) + ylim(0,1)

ggplot(dd, aes(tissue=tissue, fill=value)) +
  geom_efp(clct) + 
  expand_limits(clct) + xlim(0,1) + ylim(0,1)


dd <- subset(dd, treatment == 'control')

ggplot(dd, aes(tissue=tissue, fill=value)) +
  geom_efp(clct) + expand_limits(clct) + theme_efp()


dd <- data.frame(tissue=c("leaf-1", "leaf-2", "leaf-4", "leaf-6",
                   "leaf-7-distal", "leaf-7-prox", "leaf-7-petiole",
                   "leaf-8", "leaf-10", "leaf-12", "leaf-cauline",
                   "leaf-senescent", 'vegetative-rosette', 'root',
                   'mature-rosette', '1st-internode', '2nd-internode',
                   'cauline-leaf', 'silique-5', 'silique-4', 'bud-9',
                   'bud-10', 'bud-11', 'bud-12', 'sepal-12',
                   'petal-12', 'stamen-12', 'carpel-12', 'flower-15',
                   'pedicel-15', 'sepal-15', 'petal-15', 'stamen-15',
                   'carpel-15',
                   'mature-pollen','cotelydons','hypocotyl-root',
                   'seed-silique-embryo-3', 'seed-silique-embryo-4',
                   'seed-silique-embryo-5', 'seed-6', 'seed-7',
                   'seed-8', 'seed-9', 'seed-10',
                   'shoot-apex-vegetative',
                    'shoot-apex-transition', 'shoot-apex-inflorescence',
                   'imbibed-seed', 'dry-seed'))

dd <- data.frame(tissue=exhibits()$tissue)
dd$val <- abs(rnorm(nrow(dd),sd=40))

clct <- data.frame(exhibit=c('ath_mature_plant', 'ath_young_plant',
                     'ath_leaf_series', 
                     'ath_flower_series', 'ath_seedling',
                     'ath_seed_series', 'ath_shoot_apex',
                     'ath_dormant_seeds'),
                   x=c(.1, .27, .65, .6, .27, .7,.33, .20), y=c(.5, .4, .4, .1, .65, .8, .9, .2),
                   width=c(.3, .3, .7, .8, .17, .6, .3, .2), height=c(1, .3, .7, .8, .17, .6, .3,.2))

ggplot(dd, aes(tissue=tissue, fill=val)) +
  geom_efp(clct) + expand_limits(clct) + #theme_efp() +
  xlim(0,1) + ylim(0,1)

ggplot(dd, aes(tissue=tissue, fill=val)) +
  geom_efp(clct, labels=FALSE) + expand_limits(clct) + theme_efp() +
  xlim(0,1) + ylim(0,1)



ids <- factor(c("1.1", "2.1", "1.2", "2.2", "1.3", "2.3"))
values <- data.frame(id=ids, value=c(3, 3.1, 3.1, 3.2, 3.15, 3.5))
positions <- data.frame(id=rep(ids, each=4),
  x=c(2, 1, 1.1, 2.2, 1, 0, 0.3, 1.1, 2.2, 1.1, 1.2, 2.5, 1.1, 0.3,
    0.5, 1.2, 2.5, 1.2, 1.3, 2.7, 1.2, 0.5, 0.6, 1.3),
  y=c(-0.5, 0, 1, 0.5, 0, 0.5, 1.5, 1, 0.5, 1, 2.1, 1.7, 1, 1.5,
    2.2, 2.1, 1.7, 2.1, 3.2, 2.8, 2.1, 2.2, 3.3, 3.2))

ggplot(values) + geom_map(aes(map_id=id), map=positions)  +
  expand_limits(positions)

#!/usr/bin/Rscript

library(grImport)
library(proto)
source('../pkg/R/exhibit.R')

svgs <- list.files('../img', pattern='\\.svg$', full.names=TRUE)
svgs <- Filter(function(x) {
  if(!file.exists(gsub('svg', 'xml', x))) TRUE
  else file.info(gsub('svg', 'xml', x))$mtime < file.info(x)$mtime
}, svgs)

lapply(svgs,
       function(svg) {
         ps <- gsub('\\.svg', '.ps', svg)
         xml <- gsub('\\.svg', '.xml', svg)
         system(sprintf('inkscape %s --export-ps=%s', svg, ps))
         PostScriptTrace(ps, xml)
       })

ath_seedling <-
  exhibit$proto(img=readPicture('../img/ath-seedling.xml'),
                desc='Arabidopsis thaliana seedling',
                key=data.frame(
                  tissue=c('cotelydons','hypocotyl-root'),
                  id=c('#99FF00', '#CCCC98'),
                  stringsAsFactors=FALSE))
save(ath_seedling, file='../pkg/inst/exhibits/ath_seedling.rda')
                             
ath_leaf6 <-
  exhibit$proto(img=readPicture('../img/ath-leaf6.xml'),
                desc='Arabidopsis thaliana leaf number 6-7',
                key=data.frame(
                  tissue=c('leaf6'),
                  id=c('#800000'),
                  stringsAsFactors=FALSE))
save(ath_leaf6, file='../pkg/inst/exhibits/ath_leaf6.rda')
                             

ath_leaf_series <-
  exhibit$proto(img=readPicture('../img/ath-leaf-series.xml'),
                desc='Arabidopsis thaliana leafs 1-12, cauline and senescent',
                key=data.frame(
                  tissue=c('leaf-1', 'leaf-2', 'leaf-4', 'leaf-6',
                    'leaf-7-distal', 'leaf-7-prox', 'leaf-7-petiole',
                    'leaf-8', 'leaf-10', 'leaf-12', 'leaf-cauline',
                    'leaf-senescent'),
                  id=c('#99FE00', '#99FF66', '#98FF66', '#66CC66',
                    '#64CC66', '#00CC66', '#00CBFF', '#65CC66',
                    '#669966', '#659966', '#99CC65', '#999900'),
                  stringsAsFactors=FALSE))
save(ath_leaf_series, file='../pkg/inst/exhibits/ath_leaf_series.rda')

ath_young_plant <-
  exhibit$proto(img=readPicture('../img/ath-young-plant.xml'),
                desc='Arabidopsis thaliana young plant with vegetative rosette',
                key=data.frame(
                  tissue=c('vegetative-rosette', 'root'),
                  id=c('#99CC64', '#CCCC97'),
                  stringsAsFactors=FALSE))
 save(ath_young_plant, file='../pkg/inst/exhibits/ath_young_plant.rda')


ath_mature_plant <-
  exhibit$proto(img=readPicture('../img/ath-mature-plant.xml'),
                desc='Arabidopsis thaliana mature plant with vegetative rosette',
                key=data.frame(
                  tissue=c('mature-rosette', '1st-internode', '2nd-internode', 'cauline-leaf',
                    'silique-5', 'silique-4'),
                  id=c('#99CC66', '#00CCFF', '#99CCFF', '#99CC65',
                    '#FFCC97','#FFCC98'),
                  stringsAsFactors=FALSE))
save(ath_mature_plant, file='../pkg/inst/exhibits/ath_mature_plant.rda')


ath_flower_series <-
  exhibit$proto(img=readPicture('../img/ath-flower-series.xml'),
                desc='Arabidopsis thaliana flower development',
                key=data.frame(
                  tissue=c('bud-9', 'bud-10', 'bud-11', 'bud-12',
                    'sepal-12', 'petal-12', 'stamen-12', 'carpel-12',
                    'flower-15', 'pedicel-15',
                    'sepal-15', 'petal-15', 'stamen-15', 'carpel-15',
                    'mature-pollen'),
                  id=c('#FFFFCC', '#FFFF99', '#FFFF98', '#FFFF66',
                    '#CCFF66', '#CCFF65', '#CCFF64', '#CCFF63',
                    '#FFFF00', '#CCFF00',
                    '#CBFF00', '#CAFF00', '#C9FF00', '#C8FF00',
                    '#FF0000'),
                  stringsAsFactors=FALSE))
save(ath_flower_series, file='../pkg/inst/exhibits/ath_flower_series.rda')


ath_seed_series <-
  exhibit$proto(img=readPicture('../img/ath-seed-series.xml'),
                desc='Arabidopsis thaliana seed development',
                key=data.frame(
                  tissue=c('seed-silique-embryo-3', 'seed-silique-embryo-4', 'seed-silique-embryo-5',
                    'seed-6', 'seed-7', 'seed-8',
                    'seed-9', 'seed-10'),
                  id=c('#FFCC99', '#FFCC98',  '#FFCC97',
                    '#FFCC00', '#FECC00', '#FDCC00', '#FF9900',
                    '#FE9900'),
                  stringsAsFactors=FALSE))
save(ath_seed_series, file='../pkg/inst/exhibits/ath_seed_series.rda')


ath_shoot_apex <-
  exhibit$proto(img=readPicture('../img/ath-shoot-apex.xml'),
                desc='Arabidopsis thaliana shoot apex',
                key=data.frame(
                  tissue=c('shoot-apex-vegetative',
                    'shoot-apex-transition', 'shoot-apex-inflorescence'),
                  id=c('#969999', '#989999', '#979999'),
                  stringsAsFactors=FALSE))
save(ath_shoot_apex, file='../pkg/inst/exhibits/ath_shoot_apex.rda')


ath_dormant_seeds <-
  exhibit$proto(img=readPicture('../img/ath-dormant-seeds.xml'),
                desc='Arabidopsis thaliana seeds pre-germination',
                key=data.frame(
                  tissue=c('imbibed-seed', 'dry-seed'),
                  id=c('#EE7700', '#FF7700'),
                  stringsAsFactors=FALSE))
save(ath_dormant_seeds, file='../pkg/inst/exhibits/ath_dormant_seeds.rda')

#!/usr/bin/Rscript

library(grImport)
library(proto)
source('../pkg/R/exhibit.R')

lapply(list.files('../img', pattern='\\.svg$', full.names=TRUE),
       function(svg) {
         ps <- gsub('\\.svg', '.ps', svg)
         xml <- gsub('\\.svg', '.xml', svg)
         system(sprintf('inkscape %s --export-ps=%s', svg, ps))
         PostScriptTrace(ps, xml)
       })

ara_seedling <-
  exhibit$proto(img=readPicture('../img/ath-seedling.xml'),
                desc='Arabidopsis thaliana seedling',
                key=data.frame(
                  tissue=c('cotelydons','hypocotyl','root'),
                  id=c('#800000', '#FF0000', '#808000'),
                  stringsAsFactors=FALSE))
save(ara_seedling, file='../pkg/inst/exhibits/ath_seedling.rda')
                             
ath_leaf6 <-
  exhibit$proto(img=readPicture('../img/ath-leaf6.xml'),
                desc='Arabidopsis thaliana leaf number 6-7',
                key=data.frame(
                  tissue=c('leaf6'),
                  id=c('#800000'),
                  stringsAsFactors=FALSE))
save(ath_leaf6, file='../pkg/inst/exhibits/ath_leaf6.rda')
                             

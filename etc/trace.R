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

ath_seedling <-
  exhibit$proto(img=readPicture('../img/ath-seedling.xml'),
                desc='Arabidopsis thaliana seedling',
                key=data.frame(
                  tissue=c('cotelydons','hypocotyl','root'),
                  id=c('#800000', '#FF0000', '#808000'),
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

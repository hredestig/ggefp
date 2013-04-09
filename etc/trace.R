library(grImport)
library(ggefp)

PostScriptTrace('../img/ara-seedling.ps',
                '../img/ara-seedling.xml')
ara_seedling <-
  exhibit$proto(img=readPicture('../img/ara-seedling.xml'),
                desc='arabidopsis seedling',
                key=data.frame(
                  tissue=c('cotelydons','hypocotyl','root'),
                  id=c('#8000000', '#FF0000', '#808000'),
                  stringsAsFactors=FALSE))
save(ara_seedling, file='../pkg/inst/exhibits/ara_seedling.rda')
                             

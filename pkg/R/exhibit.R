exhibit <-
  proto::proto(img=NULL, desc=NULL, key=data.frame(),
               draw=function(., ...) grid.picture(.$img, ...),
               idof=function(., x) {
                 .$key$tissue[.$key$id == x]
               },
               what='ggefp-exhibit',
               pprint=function(.) {
                 cat(sprintf('%s\n', .$desc))
               })

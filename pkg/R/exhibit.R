exhibit <-
  proto::proto(img=NULL, desc=NULL, key=data.frame(),
               what='ggefp-exhibit',
               draw=function(., ...) grid.picture(.$img, ...),
               idof=function(., x) {
                 .$key$tissue[.$key$id == x]
               },
               pprint=function(.) {
                 cat(sprintf('%s\n', .$desc))
               })

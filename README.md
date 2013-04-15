ggefp
=====

ggefp is an extension of the ggplot2 package that provides
functionatlity to plot line drawings with regions filled according to
provided data. With the right line drawings, ggefp can be used to
provide data visualization similar to those known from the [eFP
browser](http://bar.utoronto.ca/efp/cgi-bin/efpWeb.cgi) that shows
gene expression values in various tissues in plants and other species.

To install or update, run:
   
    library(devtools)
    install_dev("ggefp", subdir="pkg")

Usage
-----

The line drawings to display are denoted *exhibits* and define the
line drawing as well as which paths correspond to which tissue. To see
the exhibits provided with the package (currently only toy example)



```r
library(ggefp)
exhibits()
```

```
##        exhibit     tissue
## 1    ath_leaf6      leaf6
## 2 ath_seedling cotelydons
## 3 ath_seedling  hypocotyl
## 4 ath_seedling       root
```


We can define a combination of exhibits to use to a *collection* by
specifiying the names of the exhibits and where to plot them.


```r
collection <- data.frame(exhibit = c("ath_seedling", "ath_leaf6"), x = c(0.5, 
    0.2), y = c(0.5, 0.3), width = c(1, 0.3), height = c(1, 0.3))
```


we can then define some data and generate the plot


```r
values <- data.frame(tissue = rep(c("leaf6", "cotelydons", "root", "hypocotyl"), 
    2), value = c(1, 1000, 200, 20, 1100, 40, 60, 900), treatment = rep(c("control", 
    "cold"), each = 4))
collection <- data.frame(exhibit = c("ath_seedling", "ath_leaf6"), x = c(0.5, 
    0.2), y = c(0.5, 0.3), width = c(1, 0.3), height = c(1, 0.3))
ggplot(values, aes(tissue = tissue, fill = value)) + geom_efp(collection) + 
    facet_wrap(~treatment) + expand_limits(collection) + xlim(0, 1) + ylim(0, 
    1) + theme_efp()
```

![plot of chunk small-example](figure/small-example.png) 


New exhibits
------------

New exhibits should first be generated in a vector graphics program
such as inkscape where each tissue is filled with a unique
color. These colors are matched with the tissue name and exhibits are
created according to (etc/trace.R). Exhibits from outside the ggefp
package are named as paths to saved R-objects (one object per rda
file)

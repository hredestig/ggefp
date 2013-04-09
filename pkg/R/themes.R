#' A theme for eFP-style pictograms
#'
#' Used as a hack to remove unwanted (pointless) scale annotations
#' @param base_size size for fonts
#' @param base_family font
#' @return a theme
#' @export
#' @author Henning Redestig
theme_efp <- function(base_size=12, base_family="") {
  theme(
    line=element_line(colour="black", size=0.5, linetype=1, lineend="butt"),
    rect=element_rect(fill="white", colour="black", size=0.5, linetype=1),
    text=element_text(family=base_family, face="plain", colour="black",
      size=base_size, hjust=0.5, vjust=0.5, angle=0, lineheight=0.9),
    axis.text=element_text(size=unit(0, 'npc')), 
    axis.line=element_blank(),
    axis.text.x=element_text(vjust=1), 
    axis.text.y=element_text(size=0),
    axis.ticks=element_line(size=0), 
    axis.title.x=element_text(size=0),
    axis.title.y=element_text(size=0), 
    axis.ticks.length=unit(0, "cm"),
    axis.ticks.margin=unit(0.1, "cm"),
    legend.background=element_rect(colour=NA), 
    legend.margin=unit(0.2, "cm"),
    legend.key=element_rect(fill="grey95",  colour="white"),
    legend.key.size=unit(1.2, "lines"), 
    legend.key.height=NULL,
    legend.key.width=NULL,
    legend.text=element_text(size=rel(0.8)), 
    legend.text.align=NULL,
    legend.title=element_text(size=rel(0.8), 
      face="bold", hjust=0), legend.title.align=NULL, 
    legend.position="right",
    legend.direction=NULL,
    legend.justification="center", 
    legend.box=NULL,
    panel.background=element_rect(fill="grey90", colour=NA),
    panel.border=element_blank(),
    panel.grid.major=element_line(colour="white"), 
    panel.grid.minor=element_line(colour="grey95", size=0.25), 
    panel.margin=unit(0.25, "lines"),
    strip.background=element_rect(fill="grey80", colour=NA),
    strip.text.x=element_text(),
    strip.text.y=element_text(angle=-90), 
    plot.background=element_rect(colour="white"),
    plot.title=element_text(size=rel(1.2)), 
    plot.margin=unit(c(1, 1, 0.5, 0.5), "lines"),
    complete=TRUE)
}

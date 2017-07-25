#' A theme for eFP-style pictograms
#'
#' Used as a hack to remove unwanted (pointless) scale annotations
#' @param base_size size for fonts
#' @param base_family font
#' @return a theme
#' @export
#' @author Henning Redestig
#' @import ggplot2
theme_efp <- function(base_size=11, base_family="") {
  half_line <- base_size/2
  theme(
      line=element_line(colour="black", size=0.5, linetype=1, lineend="butt"),
      rect=element_rect(fill="white", colour="black", size=0.5, linetype=1),
      text=element_text(
          family=base_family, face="plain", colour="black", size=base_size,
          lineheight=0.9, hjust=0.5, vjust=0.5, angle=0, margin=margin(),
          debug=FALSE),
      axis.line=element_blank(),
      axis.line.x=NULL,
      axis.line.y=NULL,
      axis.text=element_text(size=0),
      axis.text.x=element_text(size=0),
      axis.text.x.top=element_text(size=0),
      axis.text.y=element_text(size=0),
      axis.text.y.right=element_text(size=0),
      axis.ticks=element_line(size=0),
      axis.ticks.length=unit(0, "pt"),
      axis.title.x=element_text(size=0),
      axis.title.x.top=element_text(size=0),
      axis.title.y=element_text(size=0),
      axis.title.y.right=element_text(size=0),
      legend.background=element_rect(colour=NA),
      legend.spacing=unit(0.4, "cm"),
      legend.spacing.x=NULL,
      legend.spacing.y=NULL,
      legend.margin=margin(0.2, 0.2, 0.2, 0.2, "cm"),
      legend.key=element_rect(fill="grey95", colour="white"),
      legend.key.size=unit(1.2, "lines"),
      legend.key.height=NULL, legend.key.width=NULL, legend.text=element_text(size=rel(0.8)),
      legend.text.align=NULL, legend.title=element_text(hjust=0),
      legend.title.align=NULL, legend.position="right",
      legend.direction=NULL, legend.justification="center",
      legend.box=NULL,
      legend.box.margin=margin(0, 0, 0, 0, "cm"),
      legend.box.background=element_blank(),
      legend.box.spacing=unit(0.4, "cm"),
      panel.background=element_rect(fill="grey92", colour=NA),
      panel.border=element_blank(), panel.grid.major=element_line(colour="white"),
      panel.grid.minor=element_line(colour="white", size=0.25),
      panel.spacing=unit(half_line, "pt"), panel.spacing.x=NULL,
      panel.spacing.y=NULL,
      panel.ontop=FALSE,
      strip.background=element_rect(fill="grey85", colour=NA),
      strip.text=element_text(colour="grey10", size=rel(0.8)),
      strip.text.x=element_text(margin=margin(t=half_line, b=half_line)),
      strip.text.y=element_text(angle=-90, margin=margin(l=half_line, r=half_line)),
      strip.placement="inside",
      strip.placement.x=NULL,
      strip.placement.y=NULL,
      strip.switch.pad.grid=unit(0.1, "cm"),
      strip.switch.pad.wrap=unit(0.1, "cm"),
      plot.background=element_rect(colour="white"),
      plot.title=element_text(size=rel(1.2), hjust=0, vjust=1, margin=margin(b=half_line * 1.2)),
      plot.subtitle=element_text(size=rel(0.9), hjust=0, vjust=1, margin=margin(b=half_line * 0.9)),
      plot.caption=element_text(size=rel(0.9), hjust=1, vjust=1, margin=margin(t=half_line * 0.9)),
      plot.margin=margin(half_line, half_line, half_line, half_line),
      complete=TRUE)
}

#' Theme Parchment
#'
#' A ggplot2 theme styled like old parchment and ink.
#'
#' @return A themed ggplot object
#' @export
#' @import ggplot2
#' @import extrafont

theme_parchment <- function() {
    theme_bw(base_size = 12,
                 base_family = "Courier New",
                 paper = "cornsilk", ink = "black") +
    theme(
      plot.title = element_text(face = "bold", size = 25, hjust = 0.5),
      plot.subtitle = element_text(size = 15, hjust = 0.5),
      plot.caption = element_text(size = 12),
      legend.position = "top",
      legend.key.width = unit(3, "lines"),
      legend.title = element_text(face = "bold", size = 15, hjust = 0.5),
      legend.title.position = "top",
      legend.text = element_text(size = 12)
    )
}

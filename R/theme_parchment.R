#' theme_parchment()
#'
#' A `ggplot2` theme styled to resemble old parchment and ink, giving plots
#' a vintage, manuscript-like appearance.
#'
#' @return A `ggplot2` theme object that can be added to ggplot plots.
#'
#' @details
#' This theme adjusts panel backgrounds, grid lines, and text colors to
#' evoke the look of old parchment and handwritten ink. Works with `ggplot2` plots.
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#'   geom_point() +
#'   theme_parchment()
#'
#' @export
#' @import ggplot2
#' @import extrafont

theme_parchment <- function() {
    theme_bw(base_size = 12,
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

#' theme_spooky()
#'
#' A `ggplot2` theme styled for Halloween with dark backgrounds,
#' glowing text, and spooky atmosphere.
#'
#' @return A `ggplot2` theme object.
#'
#' @examples
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#'   geom_point(color = "orange") +
#'   theme_spooky()
#'
#' @export
#' @import ggplot2
theme_spooky <- function() {
  theme_minimal(base_size = 12, base_family = "serif") +
    theme(
      plot.background   = element_rect(fill = "#000000", color = NA),   # black
      panel.background  = element_rect(fill = "#000000", color = NA),
      panel.grid.major  = element_line(color = "#2E0854"),              # deep purple grid
      panel.grid.minor  = element_line(color = "#1a001f"),
      axis.text         = element_text(color = "#FF7518"),              # pumpkin orange
      axis.title        = element_text(color = "#FF4500"),
      plot.title        = element_text(face = "bold", size = 20, hjust = 0.5,
                                       color = "#39FF14"),              # eerie green glow
      plot.subtitle     = element_text(size = 14, hjust = 0.5, color = "#C0C0C0"),
      plot.caption      = element_text(size = 10, color = "#666666"),
      legend.background = element_rect(fill = "#000000", color = NA),
      legend.key        = element_rect(fill = "#000000", color = NA),
      legend.position   = "top",
      legend.title      = element_text(face = "bold", size = 13, color = "#FF7518"),
      legend.text       = element_text(size = 11, color = "#FF7518")
    )
}

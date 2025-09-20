# ==============================
# Palettes
# ==============================

palettes <- list(
  arcane_flame      = c("#7F1D1D", "#B91C1C", "#F97316", "#FDBA74", "#FDE68A"),
  enchanted_forest  = c("#065F46", "#10B981", "#6EE7B7", "#A7F3D0", "#F0FDF4"),
  mystic_ocean      = c("#0C4A6E", "#0284C7", "#38BDF8", "#A5F3FC", "#ECFEFF"),
  eldritch_night    = c("#1E1B4B", "#312E81", "#4C1D95", "#7C3AED", "#C4B5FD"),
  golden_parchment  = c("#FEF3C7", "#FDE68A", "#FCD34D", "#D97706", "#92400E")
)

# ==============================
# Unified Scales
# ==============================

#' Spellbook colour scale
#'
#' Apply a spellbook palette to a ggplot colour or fill scale.
#'
#' @param palette Name of the palette (e.g., "arcane_flame").
#' @param type Scale type: "d" for discrete or "c" for continuous.
#' @param aesthetics Aesthetic to apply ("colour" or "fill").
#' @param name Legend title.
#' @param ... Additional arguments passed to ggplot2 scale functions.
#'
#' @return A ggplot2 scale object.
#' @export
#'
#' @examples
#' ggplot(mpg, aes(class, fill = class)) +
#'   geom_bar() +
#'   scale_spellbook(palette = "eldritch_night", type = "d", aesthetics = "fill")
#'
#' ggplot(mpg, aes(displ, hwy, colour = hwy)) +
#'   geom_point(size = 3) +
#'   scale_spellbook(palette = "mystic_ocean", type = "c", aesthetics = "colour")
scale_spellbook <- function(palette,
                            type = c("d", "c"),
                            aesthetics = c("colour", "fill"),
                            name = NULL,
                            ...) {
  type <- match.arg(type)
  aesthetics <- match.arg(aesthetics)
  
  if (!palette %in% names(palettes)) {
    stop("Palette not found. Available palettes: ",
         paste(names(palettes), collapse = ", "))
  }
  
  cols <- palettes[[palette]]
  if (is.null(name)) name <- gsub("_", " ", tools::toTitleCase(palette))
  
  if (type == "d") {
    ggplot2::discrete_scale(
      aesthetics, palette,
      function(n) cols[seq_len(n)],
      name = name,
      ...
    )
  } else {
    fun <- if (aesthetics == "colour") ggplot2::scale_colour_gradientn else ggplot2::scale_fill_gradientn
    fun(colours = cols, name = name, ...)
  }
}

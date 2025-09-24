# ==============================
# Palettes
# ==============================

palettes <- list(
  arcane_flame      = c("#7F1D1D", "#B91C1C", "#F97316", "#FDBA74", "#FDE68A"),
  enchanted_forest  = c("#065F46", "#10B981", "#6EE7B7", "#A7F3D0", "#F0FDF4"),
  mystic_ocean      = c("#0C4A6E", "#0284C7", "#38BDF8", "#A5F3FC", "#ECFEFF"),
  eldritch_night    = c("#1E1B4B", "#312E81", "#4C1D95", "#7C3AED", "#C4B5FD"),
  golden_parchment  = c("#FEF3C7", "#FDE68A", "#FCD34D", "#D97706", "#92400E"),
  discrete_22 = c("#f2f3f4", "#222222", "#f3c300", "#875692", "#f38400", "#a1caf1", 
                  "#be0032", "#c2b280", "#848482", "#008856", "#e68fac", "#0067a5", 
                  "#f99379", "#604e97", "#f6a600", "#b3446c", "#dcd300", "#882d17", 
                  "#8db600", "#654522", "#e25822", "#2b3d26"),
  discrete_32 = c("#FFFFFF", "#0000FF", "#FF0000", "#00FF00", "#000033", "#FF00B6", 
                  "#005300", "#FFD300", "#009FFF", "#9A4D42", "#00FFBE", "#783FC1", 
                  "#1F9698", "#FFACFD", "#B1CC71", "#F1085C", "#FE8F42", "#DD00FF", 
                  "#201A01", "#720055", "#766C95", "#02AD24", "#C8FF00", "#886C00", 
                  "#FFB79F", "#858567", "#A10300", "#14F9FF", "#00479E", "#DC5E93", 
                  "#93D4FF", "#004CFF"),
  discrete_36 = c("#5A5156", "#E4E1E3", "#F6222E", "#FE00FA", "#16FF32", "#3283FE", 
                  "#FEAF16", "#B00068", "#1CFFCE", "#90AD1C", "#2ED9FF", "#DEA0FD", 
                  "#AA0DFE", "#F8A19F", "#325A9B", "#C4451C", "#1C8356", "#85660D", 
                  "#B10DA1", "#FBE426", "#1CBE4F", "#FA0087", "#FC1CBF", "#F7E1A0", 
                  "#C075A6", "#782AB6", "#AAF400", "#BDCDFF", "#822E1C", "#B5EFB5", 
                  "#7ED7D1", "#1C7F93", "#D85FF7", "#683B79", "#66B0FF", "#3B00FB"),
  spotify_pal = c("#0b3e34", "#1db954"),
  halloween = c("#000000", "#2E0854", "#4B0082", "#8B008B", "#FF4500", "#FF7518", "#39FF14", "#ADFF2F"),
  haunted_forest = c("#0B3D02", "#013220", "#000000", "#4B5320", "#6B8E23", "#9AA0A6", "#C0C5C1", "#F6E27F"),
  ghostly_glow = c("#E8EDEE", "#F5F5F5", "#FFFFFF", "#CDECF6", "#A4DDED", "#BFA6E2", "#D8BFD8", "#E6E6FA"),
  blood_moon = c("#8B0000", "#A52A2A", "#B22222", "#000000", "#2C003E", "#3D0075", "#6A0DAD", "#C0C0C0")
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
#' library(ggplot2)
#' library(spellbook)
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

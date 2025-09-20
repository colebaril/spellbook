# ==============================
# Palettes
# ==============================

palettes <- list(
  arcane_flame = c("#7F1D1D", "#B91C1C", "#F97316", "#FDBA74", "#FDE68A"),
  enchanted_forest = c("#065F46", "#10B981", "#6EE7B7", "#A7F3D0", "#F0FDF4"),
  mystic_ocean = c("#0C4A6E", "#0284C7", "#38BDF8", "#A5F3FC", "#ECFEFF"),
  eldritch_night = c("#1E1B4B", "#312E81", "#4C1D95", "#7C3AED", "#C4B5FD"),
  golden_parchment = c("#FEF3C7", "#FDE68A", "#FCD34D", "#D97706", "#92400E")
)

# ==============================
# Helpers
# ==============================

# Discrete scale factory
make_discrete_scale <- function(palette, name, aesthetics) {
  ggplot2::discrete_scale(
    aesthetics, palette,
    function(n) palettes[[palette]][seq_len(n)],
    name = name
  )
}

# Continuous scale factory
make_continuous_scale <- function(palette, name, type = c("color", "fill")) {
  fun <- if (type == "color") ggplot2::scale_color_gradientn else ggplot2::scale_fill_gradientn
  fun(colours = palettes[[palette]], name = name)
}

# ==============================
# Arcane Flame
# ==============================

#' Discrete scale: Arcane Flame
#'
#' Apply the Arcane Flame palette to discrete variables.
#'
#' @param name Legend title
#' @param aesthetics Aesthetic to apply (default "color" or "fill")
#' @return A ggplot2 scale
#' @export
scale_color_arcane_flame_d <- function(name = "Arcane Flame", aesthetics = "color", ...) {
  make_discrete_scale("arcane_flame", name, aesthetics)
}
scale_fill_arcane_flame_d <- function(name = "Arcane Flame", aesthetics = "fill", ...) {
  make_discrete_scale("arcane_flame", name, aesthetics)
}

#' Continuous scale: Arcane Flame
#'
#' Apply the Arcane Flame palette to continuous variables.
#'
#' @param name Legend title
#' @return A ggplot2 scale
#' @export
scale_color_arcane_flame_c <- function(name = "Arcane Flame", ...) {
  make_continuous_scale("arcane_flame", name, type = "color")
}
scale_fill_arcane_flame_c <- function(name = "Arcane Flame", ...) {
  make_continuous_scale("arcane_flame", name, type = "fill")
}

# ==============================
# Enchanted Forest
# ==============================

#' Discrete scale: Enchanted Forest
#'
#' Apply the Enchanted Forest palette to discrete variables.
#'
#' @param name Legend title
#' @return A ggplot2 scale
#' @export
scale_color_enchanted_forest_d <- function(name = "Enchanted Forest", aesthetics = "color", ...) {
  make_discrete_scale("enchanted_forest", name, aesthetics)
}
scale_fill_enchanted_forest_d <- function(name = "Enchanted Forest", aesthetics = "fill", ...) {
  make_discrete_scale("enchanted_forest", name, aesthetics)
}

#' Continuous scale: Enchanted Forest
#'
#' Apply the Enchanted Forest palette to continuous variables.
#'
#' @param name Legend title
#' @return A ggplot2 scale
#' @export
scale_color_enchanted_forest_c <- function(name = "Enchanted Forest", ...) {
  make_continuous_scale("enchanted_forest", name, type = "color")
}
scale_fill_enchanted_forest_c <- function(name = "Enchanted Forest", ...) {
  make_continuous_scale("enchanted_forest", name, type = "fill")
}

# ==============================
# Mystic Ocean
# ==============================

#' Discrete scale: Mystic Ocean
#'
#' Apply the Mystic Ocean palette to discrete variables.
#'
#' @param name Legend title
#' @return A ggplot2 scale
#' @export
scale_color_mystic_ocean_d <- function(name = "Mystic Ocean", aesthetics = "color", ...) {
  make_discrete_scale("mystic_ocean", name, aesthetics)
}
scale_fill_mystic_ocean_d <- function(name = "Mystic Ocean", aesthetics = "fill", ...) {
  make_discrete_scale("mystic_ocean", name, aesthetics)
}

#' Continuous scale: Mystic Ocean
#'
#' Apply the Mystic Ocean palette to continuous variables.
#'
#' @param name Legend title
#' @return A ggplot2 scale
#' @export
scale_color_mystic_ocean_c <- function(name = "Mystic Ocean", ...) {
  make_continuous_scale("mystic_ocean", name, type = "color")
}
scale_fill_mystic_ocean_c <- function(name = "Mystic Ocean", ...) {
  make_continuous_scale("mystic_ocean", name, type = "fill")
}

# ==============================
# Eldritch Night
# ==============================

#' Discrete scale: Eldritch Night
#'
#' Apply the Eldritch Night palette to discrete variables.
#'
#' @param name Legend title
#' @return A ggplot2 scale
#' @export
scale_color_eldritch_night_d <- function(name = "Eldritch Night", aesthetics = "color", ...) {
  make_discrete_scale("eldritch_night", name, aesthetics)
}
scale_fill_eldritch_night_d <- function(name = "Eldritch Night", aesthetics = "fill", ...) {
  make_discrete_scale("eldritch_night", name, aesthetics)
}

#' Continuous scale: Eldritch Night
#'
#' Apply the Eldritch Night palette to continuous variables.
#'
#' @param name Legend title
#' @return A ggplot2 scale
#' @export
scale_color_eldritch_night_c <- function(name = "Eldritch Night", ...) {
  make_continuous_scale("eldritch_night", name, type = "color")
}
scale_fill_eldritch_night_c <- function(name = "Eldritch Night", ...) {
  make_continuous_scale("eldritch_night", name, type = "fill")
}

# ==============================
# Golden Parchment
# ==============================

#' Discrete scale: Golden Parchment
#'
#' Apply the Golden Parchment palette to discrete variables.
#'
#' @param name Legend title
#' @return A ggplot2 scale
#' @export
scale_color_golden_parchment_d <- function(name = "Golden Parchment", aesthetics = "color", ...) {
  make_discrete_scale("golden_parchment", name, aesthetics)
}
scale_fill_golden_parchment_d <- function(name = "Golden Parchment", aesthetics = "fill", ...) {
  make_discrete_scale("golden_parchment", name, aesthetics)
}

#' Continuous scale: Golden Parchment
#'
#' Apply the Golden Parchment palette to continuous variables.
#'
#' @param name Legend title
#' @return A ggplot2 scale
#' @export
scale_color_golden_parchment_c <- function(name = "Golden Parchment", ...) {
  make_continuous_scale("golden_parchment", name, type = "color")
}
scale_fill_golden_parchment_c <- function(name = "Golden Parchment", ...) {
  make_continuous_scale("golden_parchment", name, type = "fill")
}

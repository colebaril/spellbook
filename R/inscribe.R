#' inscribe
#'
#' Add a social media caption to a ggplot or gt table.
#'
#' @param x A ggplot object or gt table
#' @param type Either "plot" or "table"
#' @param github_username Your GitHub username (default: "colebaril")
#' @return A ggplot or gt object with a caption applied
#' @export
#' @import ggplot2
#' @import gt
#' @import glue
#' @import sysfonts
#' @import showtext
#' @import ggtext
inscribe <- function(type = c("plot", "table"), 
                     include_data_source = FALSE,
                     data_source = NULL,
                     github_username = "colebaril",
                     bluesky_username = "@colebaril.ca") {
  type <- match.arg(type)
  

  sysfonts::font_add( family = "Font Awesome 7 Brands", 
                      regular = "D:/Projects/fa/fontawesome-free-7.0.1-desktop/otfs/Font Awesome 7 Brands-Regular-400.otf") 
  showtext::showtext_auto()
  
  github_icon <- "\uf09b"  
  bluesky_icon <- "\ue671"
  
  social_caption <- glue::glue(
    "<div style='text-align:left; display:inline-block;'>
      <span style='font-weight:bold; color:#4d4d4d;'>Graphic:</span>
      <span style='font-family:\"Font Awesome 7 Brands\"; color:#4d4d4d;'>{github_icon}</span>
      <span style='color:#4d4d4d;'>{github_username}</span>
      <span style='margin-left:15px;'></span>
      <span style='font-family:\"Font Awesome 7 Brands\"; color:#4d4d4d;'>{bluesky_icon}</span>
      <span style='color:#4d4d4d;'>{bluesky_username}</span>
    </div>"
  )
  
  if (include_data_source && !is.null(data_source)) {
    data_caption <- glue::glue(
      "<div style='text-align:right; float:right; display:inline-block;'>
        <span style='font-weight:bold; color:#4d4d4d;'>Data:</span> 
        <span style='color:#4d4d4d;'>{data_source}</span>
      </div>"
    )
    full_caption <- glue::glue("{social_caption}{data_caption}")
  } else {
    full_caption <- social_caption
  }
  
  if (type == "plot") {
    return(list(
      labs(caption = full_caption),
      theme(plot.caption = ggtext::element_textbox_simple(size = 12, face = "bold", halign = 0)) # 0 = left alignment, but HTML floats handle placement
    ))
  } else if (type == "table") {
    return(function(x) gt::tab_source_note(x, gt::md(full_caption)))
  }
}

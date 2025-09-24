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
                     github_username = "colebaril",
                     bluesky_username = "@colebaril.ca") {
  type <- match.arg(type)
  


  
  github_icon <- "\uf09b"  
  bluesky_icon <- "\ue671"
  social_caption <- glue::glue(
    "<span style='font-family:\"Font Awesome 7 Brands\"; color:#4d4d4d;'>{github_icon}</span>
   <span style='color:#4d4d4d;'>{github_username}</span>
   <span style='margin-left:15px;'></span>
   <span style='font-family:\"Font Awesome 7 Brands\"; color:#4d4d4d;'>{bluesky_icon}</span>
   <span style='color:#4d4d4d;'>{bluesky_username}</span>"
  )
  
  if (type == "plot") {
    return(list(
      labs(caption = social_caption),
      theme(plot.caption = ggtext::element_textbox_simple(size = 12))
    ))
  } else if (type == "table") {
    return(function(x) gt::tab_source_note(x, gt::md(social_caption)))
  }
}

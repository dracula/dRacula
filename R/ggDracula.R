library(ggplot2)


dracula_pal <- c(
  "#FF5555", # red
  "#FFB86C", # orange
  "#F1FA8C", # yellow
  "#50FA7B", # green
  "#BD93F9", # purple
  "#8BE9FD", # cyan
  "#FF79C6"  # pink
)


#' Dracula Palette
#'
#' Provides the more vibrant colors of Dracula to stand out in front of `theme_dracula()`.
#'
#' @param num_cols Number of colors to return.
#'  If missing, defaults to the length of the entire palette.
#' @param var_type Variable type.
#'  Using `var_type = "discrete"` will return the number of colors provided by `num_cols`.
#'  `dracula_palette()` will recycle through the palette if `num_cols` > 7.
#'  Using `var_type = "continuous"` will create a color ramp with the number of colors provided by `num_cols`.
#'
#' @return Dracula palette
#' @export
#'
#' @examples
#' dracula_palette(num_col  = nlevels(factor(mpg$manufacturer)), var_type = "discrete")
#' dracula_palette(var_type = "continuous")
dracula_palette <- function(num_cols, var_type = c("discrete", "continuous")) {
  type <- match.arg(var_type)
  
  if (missing(num_cols)) {
    num_cols <- length(dracula_pal)
  }
  
  dracula <- switch(
    type,
    # Recycles palette colors to desired discrete length
    "discrete"   = rep(dracula_pal, length.out = num_cols),
    # Interpolates colors
    "continuous" = grDevices::colorRampPalette(dracula_pal)(num_cols)
  )

  structure(
    dracula,
    name  = "dracula",
    class = "palette"
  )
}


#' Theme Dracula
#'
#' Provides a minimal `ggplot2` theme with a Dracula-ish, dark backdrop.
#' 
#' @export
#'
#' @examples
#' theme_set(theme_dracula())
theme_dracula <- function() { 
  theme_minimal(base_size = 12) %+replace% 
    theme(
      axis.text  = element_text(color = "#f8f8f2"),
      axis.title = element_text(face = "bold", color = "#6272A4"),
      
      strip.text = element_text(face = "bold", colour="#6272A4"),
      
      legend.background = element_rect(fill  = "transparent", color = NA),
      legend.key        = element_rect(fill  = "transparent", color = NA),
      legend.text       = element_text(color = "#f8f8f2"),
      legend.title      = element_text(face  = "bold", color = "#6272A4"),
      
      panel.background  = element_blank(),
      panel.grid        = element_line(color = "#44475a"),
      
      plot.background = element_rect(fill = "#282a36", color = "#44475A"), 
      
      title = element_text(face = "bold", color = "#f8f8f2")
    )
}


print.dracula_palette <- function() {
  scales::show_col(dracula_pal)
}

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


theme_dracula <- function() { 
  theme_minimal(base_size = 12) %+replace% 
    theme(
      axis.text  = element_text(color = "#f8f8f2"),
      axis.title = element_text(face = "bold", color = "#6272A4"),
      
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

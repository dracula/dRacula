library(ggplot2)

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

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


print.dracula_palette <- function() {
  scales::show_col(dracula_pal)
}

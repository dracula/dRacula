#' @title Dracula Fill Scales for ggplot2
#'
#' @param ... Arguments passed on to `continuous_scale` in `scale_fill_gradientn` or to `discrete_scale`
#' @param discrete Whether the scale is discrete. Defaults to `FALSE`
#' @param aesthetics The aesthetics for the plot. Defaults to `fill`
#'
#' @importFrom ggplot2 scale_fill_gradientn scale_color_gradientn discrete_scale
#'
#' @export
scale_fill_dracula <- function(..., discrete = FALSE, aesthetics = "fill") {
  if (discrete) {
    discrete_scale(aesthetics, "dracula", dracula_discrete_bright_palette, ...)
  } else {
    scale_fill_gradientn(colors = pull(dracula_tibble, hex), aesthetics = aesthetics, ...)
  }
}


#' @title Dracula Color Scales for ggplot2
#'
#' @param ... Arguments passed on to `continuous_scale` in `scale_colour_gradientn` or to `discrete_scale`
#' @param discrete Whether the scale is discrete. Defaults to `FALSE`
#' @param aesthetics The aesthetics for the plot. Defaults to `color`
#'
#' @importFrom ggplot2 scale_fill_gradientn scale_color_gradientn discrete_scale
#'
#' @export
scale_color_dracula <- function(..., discrete = FALSE, aesthetics = "color") {
  if (discrete) {
    discrete_scale(aesthetics, "dracula", dracula_discrete_bright_palette, ...)
  } else {
    scale_colour_gradientn(colors =  pull(dracula_tibble, hex), aesthetics = aesthetics, ...)
  }
}

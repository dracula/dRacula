#' @title Dracula Tibble
#'
#' @description A Tibble of Dracula data that includes the palette specification.
#'  See https://spec.draculatheme.com for details.
#'
#' @importFrom tibble tribble
#'
#' @return Dracula Tibble
#'
#' @export
dracula_tibble <- tribble(
  ~palette,   ~hex,        ~rgb,                 ~hsl,
  "green",  "#50FA7B", "RGB(80, 250, 123)",  "HSL(135, 94, 65)",
  "cyan",   "#8BE9FD", "RGB(139, 233, 253)", "HSL(191, 97, 77)",
  "purple", "#BD93F9", "RGB(189, 147, 249)", "HSL(265, 89, 78)",
  "pink",   "#FF79C6", "RGB(255, 121, 198)", "HSL(326, 100, 74)",
  "red",    "#FF5555", "RGB(255, 85, 85)",   "HSL(0, 100, 67)",
  "orange", "#FFB86C", "RGB(255, 184, 108)", "HSL(31, 100, 71)",
  "yellow", "#F1FA8C", "RGB(241, 250, 140)", "HSL(65, 92, 76)"
)


#' @title Dracula Bright Palette
#'
#' @description Used in conjunction with `dracula_discrete_bright_palette` as an
#'   internal closure for interfacing with `scale_fill_dracula` and `scale_color_dracula`.
#'
#' @noRd
#'
#' @importFrom dplyr pull
dracula_bright_palette <- function() {
  function(n) {
    pull(dracula_tibble, "hex")[1:n]
  }
}


#' @title Dracula Discrete Bright Palette
#'
#' @description Used in conjunction with `dracula_bright_palette` as an
#'   internal closure for interfacing with `scale_fill_dracula` and `scale_color_dracula`
#'
#' @param n Number of colors to return.
#'  If missing, defaults to the length of the entire palette
#'
#' @noRd
#'
#' @return Function for interfacing with scale functions
dracula_discrete_bright_palette <- function(n) {
  if (missing(n)) {
    n <- 7
  }

  if (n > 7) {
    stop("WARNING: Cannot use n > 7")
  }

  dracula <- dracula_bright_palette()(n)

  structure(
    dracula,
    name  = "dracula",
    class = "palette"
  )
}

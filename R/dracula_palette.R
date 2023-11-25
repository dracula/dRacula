#' @title Dracula Tibble
#'
#' @description A Tibble of Dracula data
#'
#' @importFrom tibble tribble
#'
#' @return Dracula Tibble
#'
#' @export
dracula_tibble <- tribble(
  ~palette,   ~hex,
  "red",    "#FF5555",
  "orange", "#FFB86C",
  "yellow", "#F1FA8C",
  "green",  "#50FA7B",
  "purple", "#BD93F9",
  "cyan",   "#8BE9FD",
  "pink",   "#FF79C6"
)


#' @title Dracula Bright Palette
#'
#' @description Used in conjunction with `dracula_discrete_bright_palette` as an
#'   internal closure for interfacing with `scale_fill_dracula` and `scale_color_dracula`.
#'
#' @importFrom dplyr pull
dracula_bright_palette <- function() {
  function(n) {
     pull(dracula_tibble, hex)[1:n]
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
#' @return Function for interfacing with scale functions
dracula_discrete_bright_palette <- function(n) {
  if (missing(n)) {
    n <- 7
  }

  if (n > 7) {
    stop("You can't do that")
  }

  dracula <- dracula_bright_palette()(n)

  structure(
    dracula,
    name  = "dracula",
    class = "palette"
  )
}

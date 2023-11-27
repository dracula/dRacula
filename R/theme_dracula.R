#' @title Theme Dracula
#'
#' @description Provides a minimal `ggplot2` theme with a Dracula-ish, dark backdrop.
#'
#' @examples
#' # Set the current `ggplot2` theme with `ggplot2::theme_set`:
#' theme_set(theme_dracula())
#'
#' # Or set it for the plot in the pipeline:
#' library(dplyr)
#' library(ggDracula)
#' library(ggplot2)
#'
#' mpg %>%
#'   filter(manufacturer %in% c("honda", "ford", "dodge", "audi")) %>%
#'   group_by(manufacturer) %>%
#'   summarize(mean_hwy = mean(hwy)) %>%
#'   ggplot(aes(x = manufacturer, y = mean_hwy, fill = manufacturer)) +
#'   theme(legend.position = "none") +
#'   coord_flip() + geom_col() +
#'   scale_fill_dracula(discrete = TRUE) +
#'   theme_dracula()
#' @export
theme_dracula <- function() {
  theme_minimal(base_size = 12) %+replace%
    theme(
      axis.text  = element_text(color = "#f8f8f2"),
      axis.title = element_text(face = "bold", color = "#6272A4"),

      strip.text = element_text(face = "bold", colour = "#6272A4"),

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

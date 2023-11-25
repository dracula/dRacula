library(dplyr)
library(ggplot2)
library(vdiffr)

# Many of these test plots are similar/identical to the viridis package:
# https://github.com/sjmgarnier/viridis

test_that("scale_fill_dracula(discrete = FALSE)", {
  set.seed(1)
  p <- ggplot(data.frame(x = rnorm(10000), y = rnorm(10000)), aes(x = x, y = y)) +
    geom_hex() + coord_fixed() +
    ggtitle("scale_fill_dracula(discrete = FALSE)") +
    scale_fill_dracula(discrete = FALSE) + theme_dracula()

  expect_doppelganger("scale_fill_dracula(discrete = FALSE)", p)
})


test_that("scale_fill_dracula(discrete = TRUE)", {
  set.seed(1)
  p <- mpg %>%
    filter(manufacturer %in% c("honda", "ford", "dodge", "audi")) %>%
    group_by(manufacturer) %>%
    summarize(mean_hwy = mean(hwy)) %>%
    ggplot(aes(x = manufacturer, y = mean_hwy, fill = manufacturer)) +
    ggtitle("scale_fill_dracula(discrete = TRUE)") +
    theme(legend.position = "none") +
    coord_flip() + geom_col() +
    scale_fill_dracula(discrete = TRUE) +
    theme_dracula()

  expect_doppelganger("scale_fill_dracula(discrete = TRUE)", p)
})


test_that("scale_color_dracula(discrete = FALSE)", {
  dsub <- subset(diamonds, x > 5 & x < 6 & y > 5 & y < 6)
  dsub$diff <- with(dsub, sqrt(abs(x - y)) * sign(x - y))
  p <- ggplot(dsub, aes(x, y, colour = diff)) +
    geom_point() +
    ggtitle("scale_color_dracula(discrete = FALSE)") +
    scale_color_dracula(discrete = FALSE) + theme_dracula()

  expect_doppelganger("scale_color_dracula(discrete = FALSE)", p)
})


test_that("scale_color_dracula(discrete = TRUE)", {
  p <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point(size = 4, aes(colour = factor(cyl))) +
    ggtitle("scale_color_dracula(discrete = TRUE)") +
    scale_color_dracula(discrete = TRUE) + theme_dracula()

  expect_doppelganger("scale_color_dracula(discrete = TRUE)", p)
})

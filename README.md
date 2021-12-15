# Dracula for [ggplot2](https://github.com/tidyverse/ggplot2)

> A dark theme for [ggplot2](https://github.com/tidyverse/ggplot2) and `R` palette.

## theme_dracula
`theme_dracula()` provides a minimal `ggplot2` theme with a Dracula-ish, dark backdrop.

## dracula_palette
`dracula_palette()` provides the more vibrant colors of Dracula to stand out in front of `theme_dracula()`.

## Params
`dracula_palette <- function(num_cols, var_type = c("discrete", "continuous"))`

Param `num_cols` - Number of colors to return. If missing, defaults to the length of the entire palette.

Param `var_type` - Using `var_type = "discrete"` will return the number of colors provided by `num_cols`. `dracula_palette()` will recycle through the palette if `num_cols` > 7. Using `var_type = "continuous"` will create a color ramp with the number of colors provided by `num_cols`.

## Examples

```R
library(ggplot2)
library(dplyr)
theme_set(theme_dracula())

mpg %>%
  group_by(manufacturer) %>%
  summarize(mean_hwy = mean(hwy)) %>%
  ggplot(aes(x = manufacturer, y = mean_hwy, fill = manufacturer)) + 
  geom_col() + theme(legend.position = "none") + coord_flip() +
  scale_fill_manual(
    values   = dracula_palette(
      num_col  = nlevels(factor(mpg$manufacturer)), 
      var_type = "discrete"
    )
  )

mpg %>%
  ggplot(aes(x = displ, y = cty, color = hwy)) + 
  geom_point() + 
  scale_colour_gradientn(colors = dracula_palette(var_type = "continuous"))
```

![MPG Plots](screenshot.png)

## Install

All instructions can be found at [draculatheme.com/ggplot2](https://draculatheme.com/ggplot2).

## Team

This theme is maintained by the following person(s) and a bunch of [awesome contributors](https://github.com/dracula/ggplot2/graphs/contributors).

[![Jordan Bradford](https://github.com/jrdnbradford.png?size=100)](https://github.com/jrdnbradford) |
--- |
[Jordan Bradford](https://github.com/jrdnbradford) |

## License

[MIT License](./LICENSE)
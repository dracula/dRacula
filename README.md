# ggDracula: Dracula for [ggplot2](https://github.com/tidyverse/ggplot2)

> A dark theme for [ggplot2](https://github.com/tidyverse/ggplot2) and `R` palette.

![MPG Plots](screenshot.png)

## Installation
```R
devtools::install_github("dracula/ggplot2")
library(ggDracula)
```

## theme_dracula

`theme_dracula()` provides a minimal `ggplot2` theme with a Dracula-ish, dark backdrop.

## dracula_palette

`dracula_palette()` provides the more vibrant colors of Dracula to stand out in front of `theme_dracula()`.

## Params

```R
palette <- dracula_palette(num_cols, var_type = c("discrete", "continuous"))
```

Param `num_cols` - Number of colors to return. If missing, defaults to the length of the entire palette.

Param `var_type` - Using `var_type = "discrete"` will return the number of colors provided by `num_cols`. `dracula_palette()` will recycle through the palette if `num_cols` > 7. Using `var_type = "continuous"` will create a color ramp with the number of colors provided by `num_cols`.

## Examples

See the [beginning of the README](#dracula-for-ggplot2) for the examples produced.

```R
library(ggplot2)
library(ggDracula)
library(dplyr)
theme_set(theme_dracula())

# Left bar chart
mpg %>%
  group_by(manufacturer) %>%
  summarize(mean_hwy = mean(hwy)) %>%
  ggplot(aes(x = manufacturer, y = mean_hwy, fill = manufacturer)) +
  theme(legend.position = "none") +
  coord_flip() +
  geom_col() +
  scale_fill_manual(
    values = dracula_palette(
      num_col  = nlevels(factor(mpg$manufacturer)),
      var_type = "discrete"
    )
  )

# Right scatterplot
mpg %>%
  ggplot(aes(x = displ, y = cty, color = hwy)) +
  geom_point() +
  scale_colour_gradientn(colors = dracula_palette(var_type = "continuous"))
```

## Install

All instructions can be found at [draculatheme.com/ggplot2](https://draculatheme.com/ggplot2).

## Team

This theme is maintained by the following person(s) and a bunch of [awesome contributors](https://github.com/dracula/ggplot2/graphs/contributors).

| [![Jordan Bradford](https://github.com/jrdnbradford.png?size=100)](https://github.com/jrdnbradford) |
| --------------------------------------------------------------------------------------------------- |
| [Jordan Bradford](https://github.com/jrdnbradford)                                                  |

## Community

- [Twitter](https://twitter.com/draculatheme) - Best for getting updates about themes and new stuff.
- [GitHub](https://github.com/dracula/dracula-theme/discussions) - Best for asking questions and discussing issues.
- [Discord](https://draculatheme.com/discord-invite) - Best for hanging out with the community.

## License

[MIT License](./LICENSE)

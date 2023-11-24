# ggDracula: Dracula for [ggplot2](https://github.com/tidyverse/ggplot2)

> A dark theme for [ggplot2](https://github.com/tidyverse/ggplot2) and `R` palette.

![MPG Plots](screenshot.png)

## Install

All instructions can be found at [draculatheme.com/ggplot2](https://draculatheme.com/ggplot2).
```R
devtools::install_github("dracula/ggplot2")
```
or 
```R
remotes::install_github("dracula/ggplot2")
```

## Examples

See the [beginning of the README](#ggdracula-dracula-for-ggplot2) for the examples produced.

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

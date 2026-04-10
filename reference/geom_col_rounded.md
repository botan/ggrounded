# Bar plot with rounded corners

Create a bar plot with rounded corners using 'ggplot2'.
`geom_col_rounded()` and `geom_bar_rounded()` are extensions of the
[`ggplot2::geom_col()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
and
[`ggplot2::geom_bar()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
functions and they provide additional aesthetics for more visually
appealing outputs.

## Usage

``` r
geom_bar_rounded(
  mapping = NULL,
  data = NULL,
  position = ggplot2::position_stack(reverse = TRUE),
  radius = grid::unit(4, "pt"),
  ...,
  width = NULL,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)

geom_col_rounded(
  mapping = NULL,
  data = NULL,
  position = ggplot2::position_stack(reverse = TRUE),
  radius = grid::unit(4, "pt"),
  ...,
  width = NULL,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)
```

## Arguments

- mapping:

  Set of aesthetic mappings created by
  [`ggplot2::aes()`](https://ggplot2.tidyverse.org/reference/aes.html).
  If specified and `inherit.aes = TRUE` (the default), it is combined
  with the default mapping at the top level of the plot. You must supply
  `mapping` if there is no plot mapping.

- data:

  The data to be displayed in this layer. There are three options:

  If `NULL`, the default, the data is inherited from the plot data as
  specified in the call to
  [`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html).

  A `data.frame`, or other object, will override the plot data. All
  objects will be fortified to produce a data frame. See
  [`ggplot2::fortify()`](https://ggplot2.tidyverse.org/reference/fortify.html)
  for which variables will be created.

  A `function` will be called with a single argument, the plot data. The
  return value must be a `data.frame`, and will be used as the layer
  data. A `function` can be created from a `formula` (e.g.
  `~ head(.x, 10)`).

- position:

  Position adjustment, either as a string naming the adjustment (e.g.
  `"jitter"` to use `position_jitter`), or the result of a call to a
  position adjustment function. Use the latter if you need to change the
  settings of the adjustment.

- radius:

  The radius of the rounded corners, given as a unit object.

- ...:

  Other arguments passed on to
  [`ggplot2::layer()`](https://ggplot2.tidyverse.org/reference/layer.html).
  These are often aesthetics, used to set an aesthetic to a fixed value,
  like `colour = "red"` or `size = 3`. They may also be parameters to
  the paired geom/stat.

- width:

  Bar width. If not supplied, the default is to use the width of 90% of
  the resolution of the data.

- na.rm:

  If `FALSE`, the default, missing values are removed with a warning. If
  `TRUE`, missing values are silently removed.

- show.legend:

  logical. Should this layer be included in the legends? `NA`, the
  default, includes if any aesthetics are mapped. `FALSE` never
  includes, and `TRUE` always includes. It can also be a named logical
  vector to finely select the aesthetics to display.

- inherit.aes:

  If `FALSE`, overrides the default aesthetics, rather than combining
  with them. This is most useful for helper functions that define both
  data and aesthetics and shouldn't inherit behaviour from the default
  plot specification, e.g.
  [`ggplot2::borders()`](https://ggplot2.tidyverse.org/reference/annotation_borders.html).

## Value

A ggplot object.

## Note

The code in this function was adapted from a solution provided by Stack
Overflow user 'sthoch' in the following post:
<https://stackoverflow.com/questions/62176038/r-ggplot2-bar-chart-with-round-corners-on-top-of-bar>

## Examples

``` r
library(ggplot2)

ggplot(data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2)), aes(x, y)) +
  geom_col_rounded()


ggplot(mpg, aes(class)) +
  geom_bar_rounded()
```

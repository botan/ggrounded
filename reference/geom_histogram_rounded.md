# Histogram with rounded bars

Create a histogram with rounded corners using 'ggplot2'.
`geom_histogram_rounded()` is an extension of the
[`ggplot2::geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html)
function and uses the same binning parameters as
[`ggplot2::stat_bin()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html)
while drawing bars with rounded corners.

## Usage

``` r
geom_histogram_rounded(
  mapping = NULL,
  data = NULL,
  position = "stack",
  radius = 0.2,
  ...,
  binwidth = NULL,
  bins = NULL,
  center = NULL,
  boundary = NULL,
  closed = c("right", "left"),
  pad = FALSE,
  breaks = NULL,
  drop = "none",
  orientation = NA,
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

  A normalized rounding amount between 0 and 1. Use `0` for square
  corners and `1` for the maximum rounding each bar can safely support.

- ...:

  Other arguments passed on to
  [`ggplot2::layer()`](https://ggplot2.tidyverse.org/reference/layer.html).
  These are often aesthetics, used to set an aesthetic to a fixed value,
  like `colour = "red"` or `size = 3`. They may also be parameters to
  the paired geom/stat.

- binwidth:

  The width of the bins. The default uses 30 bins that cover the range
  of the data. You should usually override this value, exploring
  multiple widths to find the best to illustrate the stories in your
  data.

- bins:

  Number of bins. Overridden by `binwidth`. Defaults to 30.

- center, boundary:

  Bin position specifiers passed to
  [`ggplot2::stat_bin()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html).

- closed:

  One of `"right"` or `"left"` indicating whether right or left edges of
  bins are included.

- pad:

  If `TRUE`, adds empty bins at either side of the range.

- breaks:

  A numeric vector of bin boundaries.

- drop:

  Controls whether empty bins are dropped. Passed to
  [`ggplot2::stat_bin()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html).

- orientation:

  The orientation of the layer. Passed to
  [`ggplot2::stat_bin()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html).

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

## Examples

``` r
library(ggplot2)

ggplot(faithful, aes(waiting)) +
  geom_histogram_rounded()
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.


ggplot(faithful, aes(waiting)) +
  geom_histogram_rounded(bins = 10, radius = 1)
```

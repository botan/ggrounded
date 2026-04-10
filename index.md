# ggrounded

ggrounded creates bar plots with rounded corners using ggplot2.

## Installation

Install the released version of ggrounded from CRAN:

``` r
install.packages("ggrounded")
```

Or install the development version from GitHub with:

``` r
# install.packages("pak")
pak::pak("botan/ggrounded")
```

## Usage

There are two types of bar charts in ggplot2:
[`geom_bar()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
and
[`geom_col()`](https://ggplot2.tidyverse.org/reference/geom_bar.html).
[`geom_bar_rounded()`](https://botan.github.io/ggrounded/reference/geom_col_rounded.md)
and
[`geom_col_rounded()`](https://botan.github.io/ggrounded/reference/geom_col_rounded.md)
are wrappers on them for rounding the top corners.
[`geom_bar_rounded()`](https://botan.github.io/ggrounded/reference/geom_col_rounded.md)
makes the height of the bar proportional to the number of cases in each
group (or if the `weight` aesthetic is supplied, the sum of the
weights).

``` r
library(ggrounded)
library(ggplot2)

ggplot(mpg, aes(class)) +
  geom_bar_rounded()
```

![](reference/figures/README-example1-1.png)

If you want the heights of the bars to represent values in the data, use
[`geom_col_rounded()`](https://botan.github.io/ggrounded/reference/geom_col_rounded.md)
instead.

``` r
ggplot(data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2)), aes(x, y)) +
  geom_col_rounded()
```

![](reference/figures/README-example2-1.png)

## Code of Conduct

Please note that the ggrounded is released with a [contributor code of
conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct.html).
By contributing in this project you agree to abide by its terms.

## License

This package is released under the MIT License.


<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggrounded

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

A mini-package for creating bar plots with rounded corners using
ggplot2.

## Installation

You can install the development version of ggrounded from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("botan/ggrounded")
```

## Example

This is a very basic example:

``` r
library(ggrounded)
library(ggplot2)

ggplot(data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2)), aes(x, y)) +
geom_col_rounded()
```

<img src="man/figures/README-example-1.png" width="100%" />

## Code of Conduct

Please note that the ggrounded is released with a [contributor code of
conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct.html).
By contributing in this project you agree to abide by its terms.

## License

This package is released under the MIT License.

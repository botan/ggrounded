# Changelog

## ggrounded (development version)

- Horizontal bars now round the terminal bar edge correctly for both
  [`geom_col_rounded()`](https://botan.github.io/ggrounded/reference/geom_col_rounded.md)
  and
  [`geom_bar_rounded()`](https://botan.github.io/ggrounded/reference/geom_col_rounded.md).
- README examples now include a horizontal rounded bar example.

## ggrounded 0.1.0

- Breaking change: `radius` now uses normalized bar-relative values from
  `0` to `1` instead of
  [`grid::unit()`](https://rdrr.io/r/grid/unit.html) inputs.
- Rounded corners now scale with each bar’s geometry and clamp
  automatically for dense bars, short bars, and negative bars.
- [`geom_histogram_rounded()`](https://botan.github.io/ggrounded/reference/geom_histogram_rounded.md)
  added for rounded histogram bins.

## ggrounded 0.0.3

CRAN release: 2023-05-11

- `geom_bar_rounded` added.

## ggrounded 0.0.2

CRAN release: 2023-05-08

- `vdiffr` moved from Imports to Suggests.

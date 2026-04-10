# ggrounded (development version)

* Horizontal bars now round the terminal bar edge correctly for both
  `geom_col_rounded()` and `geom_bar_rounded()`.
* README examples now include a horizontal rounded bar example.

# ggrounded 0.1.0

* Breaking change: `radius` now uses normalized bar-relative values from `0`
  to `1` instead of `grid::unit()` inputs.
* Rounded corners now scale with each bar's geometry and clamp automatically
  for dense bars, short bars, and negative bars.
* `geom_histogram_rounded()` added for rounded histogram bins.

# ggrounded 0.0.3

* `geom_bar_rounded` added.

# ggrounded 0.0.2

* `vdiffr` moved from Imports to Suggests.

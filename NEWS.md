# ggrounded (development version)

* Breaking change: `radius` now uses normalized bar-relative values from `0`
  to `1` instead of `grid::unit()` inputs.
* Rounded corners now scale with each bar's geometry and clamp automatically
  for dense bars, short bars, and negative bars.
* `geom_histogram_rounded()` added for rounded histogram bins.

# ggrounded 0.0.3

* `geom_bar_rounded` added.

# ggrounded 0.0.2

* `vdiffr` moved from Imports to Suggests.

#' Histogram with rounded bars
#'
#' @description Create a histogram with rounded corners using
#'   'ggplot2'. `geom_histogram_rounded()` is an extension of the
#'   [ggplot2::geom_histogram()] function and uses the same binning
#'   parameters as [ggplot2::stat_bin()] while drawing bars with rounded
#'   corners.
#'
#' @inheritParams geom_col_rounded
#' @param binwidth The width of the bins. The default uses 30 bins that cover
#'   the range of the data. You should usually override this value, exploring
#'   multiple widths to find the best to illustrate the stories in your data.
#' @param bins Number of bins. Overridden by `binwidth`. Defaults to 30.
#' @param center,boundary Bin position specifiers passed to
#'   [ggplot2::stat_bin()].
#' @param closed One of `"right"` or `"left"` indicating whether right or
#'   left edges of bins are included.
#' @param pad If `TRUE`, adds empty bins at either side of the range.
#' @param breaks A numeric vector of bin boundaries.
#' @param drop Controls whether empty bins are dropped. Passed to
#'   [ggplot2::stat_bin()].
#' @param orientation The orientation of the layer. Passed to
#'   [ggplot2::stat_bin()].
#'
#' @returns A ggplot object.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(faithful, aes(waiting)) +
#'   geom_histogram_rounded()
#'
#' ggplot(faithful, aes(waiting)) +
#'   geom_histogram_rounded(bins = 10, radius = 1)
geom_histogram_rounded <-
  function(
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
  ) {
    radius <- validate_radius(radius)

    params <- list(
      radius = radius,
      na.rm = na.rm,
      orientation = orientation,
      binwidth = binwidth,
      bins = bins,
      center = center,
      boundary = boundary,
      closed = closed,
      pad = pad,
      breaks = breaks,
      ...
    )
    if (!identical(drop, "none")) {
      params$drop <- drop
    }

    ggplot2::layer(
      data = data,
      mapping = mapping,
      stat = "bin",
      geom = GeomColRounded,
      position = position,
      show.legend = show.legend,
      inherit.aes = inherit.aes,
      params = params
    )
  }

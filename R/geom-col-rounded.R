#' Bar plot with rounded corners
#'
#' @description This function creates a bar plot with rounded corners using
#'   ggplot2. It is an extension of the [ggplot2::geom_col()] function and
#'   provides additional aesthetics for a more visually appealing output.
#'
#' @param mapping Set of aesthetic mappings created by [ggplot2::aes()]. If specified and
#'   `inherit.aes = TRUE` (the default), it is combined with the default mapping
#'   at the top level of the plot. You must supply `mapping` if there is no plot
#'   mapping.
#' @param data The data to be displayed in this layer. There are three
#'    options:
#'
#'    If `NULL`, the default, the data is inherited from the plot
#'    data as specified in the call to [ggplot2::ggplot()].
#'
#'    A `data.frame`, or other object, will override the plot
#'    data. All objects will be fortified to produce a data frame. See
#'    [ggplot2::fortify()] for which variables will be created.
#'
#'    A `function` will be called with a single argument,
#'    the plot data. The return value must be a `data.frame`, and
#'    will be used as the layer data. A `function` can be created
#'    from a `formula` (e.g. `~ head(.x, 10)`).
#' @param position Position adjustment, either as a string naming the adjustment
#'   (e.g. `"jitter"` to use `position_jitter`), or the result of a call to a
#'   position adjustment function. Use the latter if you need to change the
#'   settings of the adjustment.
#' @param radius The radius of the rounded corners, given as a unit object.
#' @param ... Other arguments passed on to [ggplot2::layer()]. These are
#'   often aesthetics, used to set an aesthetic to a fixed value, like
#'   `colour = "red"` or `size = 3`. They may also be parameters
#'   to the paired geom/stat.
#' @param width Bar width. If not supplied, the default is to use the width of
#'   90% of the resolution of the data.
#' @param na.rm If `FALSE`, the default, missing values are removed with
#'   a warning. If `TRUE`, missing values are silently removed.
#' @param show.legend logical. Should this layer be included in the legends?
#'   `NA`, the default, includes if any aesthetics are mapped.
#'   `FALSE` never includes, and `TRUE` always includes.
#'   It can also be a named logical vector to finely select the aesthetics to
#'   display.
#' @param inherit.aes If `FALSE`, overrides the default aesthetics,
#'   rather than combining with them. This is most useful for helper functions
#'   that define both data and aesthetics and shouldn't inherit behaviour from
#'   the default plot specification, e.g. [ggplot2::borders()].
#'
#' @note The code in this function was adapted from a solution provided by
#'   Stack Overflow user 'sthoch' in the following post: `https://stackoverflow.com/questions/62176038/r-ggplot2-bar-chart-with-round-corners-on-top-of-bar`
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2)), aes(x, y)) +
#' geom_col_rounded()
geom_col_rounded <-
  function(
    mapping = NULL,
    data = NULL,
    position = ggplot2::position_stack(reverse = TRUE),
    radius = grid::unit(4, "pt"),
    ...,
    width = NULL,
    na.rm = FALSE,
    show.legend = NA,
    inherit.aes = TRUE
  ) {
    ggplot2::layer(
      data = data,
      mapping = mapping,
      stat = "identity",
      geom = GeomColRounded,
      position = position,
      show.legend = show.legend,
      inherit.aes = inherit.aes,
      params = list(
        width = width,
        radius = radius,
        na.rm = na.rm,
        ...
      )
    )
  }

GeomColRounded <- ggplot2::ggproto(
  "GeomColRounded",
  ggplot2::Geom,
  default_aes = ggplot2::aes(
    colour = NA,
    fill = "grey35",
    size = 0.5,
    linetype = 1,
    alpha = NA
  ),
  required_aes = c("x", "y"),
  setup_params = function(data, params) {
    params$flipped_aes <- ggplot2::has_flipped_aes(data, params)
    params
  },
  non_missing_aes = c("xmin", "xmax", "ymin", "ymax"),
  setup_data = function(data, params) {
    data$width <-
      data$width %||%
      params$width %||%
      (ggplot2::resolution(data$x, FALSE) * 0.9)
    transform(
      data,
      ymin = pmin(y, 0),
      ymax = pmax(y, 0),
      xmin = x - width / 2,
      xmax = x + width / 2,
      width = NULL
    )
  },
  draw_panel = function(
    self,
    data,
    panel_params,
    coord,
    width = NULL,
    radius = grid::unit(4, "pt")
  ) {
    coords <- coord$transform(data, panel_params)

    grobs <- lapply(
      seq_along(coords$xmin),
      function(i) {
        gridGeometry::polyclipGrob(
          grid::roundrectGrob(
            coords$xmin[i],
            coords$ymax[i],
            width = (coords$xmax[i] - coords$xmin[i]),
            height = (coords$ymax[i] - coords$ymin[i]),
            r = radius,
            default.units = "native",
            just = c("left", "top")
          ),
          grid::rectGrob(
            coords$xmin[i],
            coords$ymax[i] - (coords$ymax[i] - coords$ymin[i]) / 2,
            width = (coords$xmax[i] - coords$xmin[i]),
            height = (coords$ymax[i] - coords$ymin[i]) / 2,
            default.units = "native",
            just = c("left", "top")
          ),
          op = "union",
          gp = grid::gpar(
            col = coords$colour[i],
            fill = ggplot2::alpha(coords$fill[i], coords$alpha[i]),
            lwd = coords$size[i] * ggplot2::.pt,
            lty = coords$linetype[i],
            lineend = "butt"
          )
        )
      }
    )

    grobs <- do.call(grid::gList, grobs)

    ggplot2:::ggname("geom_col_rounded", grid::grobTree(children = grobs))
  },
  draw_key = ggplot2::draw_key_polygon
)

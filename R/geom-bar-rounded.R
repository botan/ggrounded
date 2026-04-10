#' @rdname geom_col_rounded
#' @export
geom_bar_rounded <-
  function(
    mapping = NULL,
    data = NULL,
    position = ggplot2::position_stack(reverse = TRUE),
    radius = 0.2,
    ...,
    width = NULL,
    na.rm = FALSE,
    show.legend = NA,
    inherit.aes = TRUE
  ) {
    radius <- validate_radius(radius)

    ggplot2::layer(
      data = data,
      mapping = mapping,
      stat = "count",
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

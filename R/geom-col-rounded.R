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

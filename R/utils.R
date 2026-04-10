`%||%` <- function(x, y) if (is.null(x)) y else x # nocov

validate_radius <- function(radius) {
  if (
    inherits(radius, "unit") ||
      !is.numeric(radius) ||
      length(radius) != 1 ||
      is.na(radius) ||
      !is.finite(radius) ||
      radius < 0 ||
      radius > 1
  ) {
    stop(
      "`radius` must be a single numeric value between 0 and 1.",
      call. = FALSE
    )
  }

  radius
}

resolve_bar_radius <- function(radius) {
  grid::unit(radius / 2, "snpc")
}

bar_arc_units <- function(center_x, center_y, radius, start, end, n = 12L) {
  theta <- seq(start, end, length.out = n)

  list(
    x = center_x + radius * cos(theta),
    y = center_y + radius * sin(theta)
  )
}

rounded_bar_grob <- function(radius, gp, negative = FALSE) {
  if (isTRUE(all.equal(radius, 0))) {
    return(
      grid::rectGrob(
        0,
        1,
        width = 1,
        height = 1,
        default.units = "npc",
        just = c("left", "top"),
        gp = gp
      )
    )
  }

  corner_radius <- resolve_bar_radius(radius)

  if (negative) {
    left_arc <- bar_arc_units(
      corner_radius,
      corner_radius,
      corner_radius,
      pi,
      3 * pi / 2
    )
    right_arc <- bar_arc_units(
      grid::unit(1, "npc") - corner_radius,
      corner_radius,
      corner_radius,
      3 * pi / 2,
      2 * pi
    )

    x <- grid::unit.c(
      grid::unit(0, "npc"),
      grid::unit(0, "npc"),
      left_arc$x[-1],
      grid::unit(1, "npc") - corner_radius,
      right_arc$x[-1],
      grid::unit(1, "npc")
    )
    y <- grid::unit.c(
      grid::unit(1, "npc"),
      corner_radius,
      left_arc$y[-1],
      grid::unit(0, "npc"),
      right_arc$y[-1],
      grid::unit(1, "npc")
    )
  } else {
    left_arc <- bar_arc_units(
      corner_radius,
      grid::unit(1, "npc") - corner_radius,
      corner_radius,
      pi,
      pi / 2
    )
    right_arc <- bar_arc_units(
      grid::unit(1, "npc") - corner_radius,
      grid::unit(1, "npc") - corner_radius,
      corner_radius,
      pi / 2,
      0
    )

    x <- grid::unit.c(
      grid::unit(0, "npc"),
      grid::unit(0, "npc"),
      left_arc$x[-1],
      grid::unit(1, "npc") - corner_radius,
      right_arc$x[-1],
      grid::unit(1, "npc"),
      grid::unit(0, "npc")
    )
    y <- grid::unit.c(
      grid::unit(0, "npc"),
      grid::unit(1, "npc") - corner_radius,
      left_arc$y[-1],
      grid::unit(1, "npc"),
      right_arc$y[-1],
      grid::unit(0, "npc"),
      grid::unit(0, "npc")
    )
  }

  grid::polygonGrob(
    x = x,
    y = y,
    default.units = "npc",
    gp = gp
  )
}

dummy <- function() { # nocov start
  # vdiffr::expect_doppelganger
  grid::unit
  grid::polygonGrob
} # nocov end

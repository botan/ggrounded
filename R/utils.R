`%||%` <- function(x, y) if (is.null(x)) y else x # nocov

dummy <- function() { # nocov start
  # vdiffr::expect_doppelganger
  grid::unit
  gridGeometry::polyclipGrob
} # nocov end

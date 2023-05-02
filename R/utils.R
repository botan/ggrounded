`%||%` <- function(x, y) if (is.null(x)) y else x

dummy <- function() {
  vdiffr::expect_doppelganger
  grid::unit
  gridGeometry::polyclipGrob
}

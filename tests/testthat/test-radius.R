test_that("radius validation enforces normalized numeric inputs", {
  expect_no_error(geom_col_rounded(radius = 0))
  expect_no_error(geom_col_rounded(radius = 0.5))
  expect_no_error(geom_col_rounded(radius = 1))

  expect_error(
    geom_col_rounded(radius = grid::unit(4, "pt")),
    "`radius` must be a single numeric value between 0 and 1."
  )
  expect_error(
    geom_col_rounded(radius = c(0.2, 0.4)),
    "`radius` must be a single numeric value between 0 and 1."
  )
  expect_error(
    geom_col_rounded(radius = NA_real_),
    "`radius` must be a single numeric value between 0 and 1."
  )
  expect_error(
    geom_col_rounded(radius = Inf),
    "`radius` must be a single numeric value between 0 and 1."
  )
  expect_error(
    geom_col_rounded(radius = -0.1),
    "`radius` must be a single numeric value between 0 and 1."
  )
  expect_error(
    geom_col_rounded(radius = 1.1),
    "`radius` must be a single numeric value between 0 and 1."
  )
})

test_that("bar-relative radius is clamped by the smaller bar dimension", {
  resolve_bar_radius <- getFromNamespace("resolve_bar_radius", "ggrounded")

  grid::pushViewport(
    grid::viewport(
      width = grid::unit(100, "mm"),
      height = grid::unit(50, "mm"),
      xscale = c(0, 1),
      yscale = c(0, 1)
    )
  )
  on.exit(grid::popViewport(), add = TRUE)

  expect_equal(
    grid::convertWidth(resolve_bar_radius(1), "mm", TRUE),
    25,
    tolerance = 1e-6
  )
  expect_equal(
    grid::convertWidth(resolve_bar_radius(0.5), "mm", TRUE),
    12.5,
    tolerance = 1e-6
  )

  grid::popViewport()
  grid::pushViewport(
    grid::viewport(
      width = grid::unit(80, "mm"),
      height = grid::unit(10, "mm")
    )
  )

  expect_equal(
    grid::convertWidth(resolve_bar_radius(1), "mm", TRUE),
    5,
    tolerance = 1e-6
  )
  expect_equal(
    grid::convertWidth(resolve_bar_radius(0.5), "mm", TRUE),
    2.5,
    tolerance = 1e-6
  )
})

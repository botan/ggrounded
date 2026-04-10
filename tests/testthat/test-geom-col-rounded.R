df <- data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2))
p <- ggplot2::ggplot(df, ggplot2::aes(x, y)) + geom_col_rounded()
p_square <- ggplot2::ggplot(df, ggplot2::aes(x, y)) + geom_col_rounded(radius = 0)
p_max <- ggplot2::ggplot(df, ggplot2::aes(x, y)) + geom_col_rounded(radius = 1)
df_negative <- data.frame(x = letters[1:4], y = c(2.3, -1.9, 3.2, -2.6))
p_negative <- ggplot2::ggplot(df_negative, ggplot2::aes(x, y)) +
  ggplot2::geom_hline(yintercept = 0, linetype = "dotted") +
  geom_col_rounded()
df_horizontal <- data.frame(category = letters[1:3], value = c(2.3, 1.9, 3.2))
p_horizontal <- ggplot2::ggplot(df_horizontal, ggplot2::aes(value, category)) +
  geom_col_rounded()
df_horizontal_negative <- data.frame(
  category = letters[1:4],
  value = c(2.3, -1.9, 3.2, -2.6)
)
p_horizontal_negative <-
  ggplot2::ggplot(df_horizontal_negative, ggplot2::aes(value, category)) +
  geom_col_rounded()
df_dense <- data.frame(x = letters[1:12], y = c(12, 7, 10, 5, 11, 8, 6, 9, 4, 3, 2, 1))
p_dense <- ggplot2::ggplot(df_dense, ggplot2::aes(x, y)) +
  geom_col_rounded(radius = 1)

test_that("geom_col_rounded() works", {
  vdiffr::expect_doppelganger("geom-col-rounded", p)
})

test_that("geom_col_rounded() can draw square corners", {
  vdiffr::expect_doppelganger("geom-col-rounded-square", p_square)
})

test_that("geom_col_rounded() can fully round the top corners", {
  vdiffr::expect_doppelganger("geom-col-rounded-max", p_max)
})

test_that("geom_col_rounded() works with negative values", {
  vdiffr::expect_doppelganger("geom-col-rounded-negative", p_negative)
})

test_that("geom_col_rounded() supports horizontal bars", {
  built <- ggplot2::ggplot_build(p_horizontal)$data[[1]]

  expect_true(all(built$flipped_aes))
  expect_equal(built$xmin, pmin(df_horizontal$value, 0))
  expect_equal(built$xmax, pmax(df_horizontal$value, 0))
  expect_equal(built$ymin, c(0.55, 1.55, 2.55))
  expect_equal(built$ymax, c(1.45, 2.45, 3.45))
})

test_that("geom_col_rounded() draws horizontal negative bars", {
  built <- ggplot2::ggplot_build(p_horizontal_negative)$data[[1]]

  expect_equal(built$xmin, pmin(df_horizontal_negative$value, 0))
  expect_equal(built$xmax, pmax(df_horizontal_negative$value, 0))
  expect_s3_class(ggplot2::ggplotGrob(p_horizontal_negative), "gtable")
})

test_that("geom_col_rounded() scales rounding across dense bars", {
  vdiffr::expect_doppelganger("geom-col-rounded-dense", p_dense)
})

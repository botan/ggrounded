df <- data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2))
p <- ggplot2::ggplot(df, ggplot2::aes(x, y)) + geom_col_rounded()
p_square <- ggplot2::ggplot(df, ggplot2::aes(x, y)) + geom_col_rounded(radius = 0)
p_max <- ggplot2::ggplot(df, ggplot2::aes(x, y)) + geom_col_rounded(radius = 1)
df_negative <- data.frame(x = letters[1:4], y = c(2.3, -1.9, 3.2, -2.6))
p_negative <- ggplot2::ggplot(df_negative, ggplot2::aes(x, y)) +
  ggplot2::geom_hline(yintercept = 0, linetype = "dotted") +
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

test_that("geom_col_rounded() scales rounding across dense bars", {
  vdiffr::expect_doppelganger("geom-col-rounded-dense", p_dense)
})

df <- data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2))
p <-  ggplot2::ggplot(df, ggplot2::aes(x, y)) + geom_col_rounded()
df_negative <- data.frame(x = letters[1:4], y = c(2.3, -1.9, 3.2, -2.6))
p_negative <- ggplot2::ggplot(df_negative, ggplot2::aes(x, y)) +
  ggplot2::geom_hline(yintercept = 0, linetype = "dotted") +
  geom_col_rounded()

test_that("geom_col_rounded() works", {
  vdiffr::expect_doppelganger("geom-col-rounded", p)
})

test_that("geom_col_rounded() works with negative values", {
  vdiffr::expect_doppelganger("geom-col-rounded-negative", p_negative)
})

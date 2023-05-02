df <- data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2))
p <-  ggplot2::ggplot(df, ggplot2::aes(x, y)) + geom_col_rounded()

test_that("geom_col_rounded() works", {
  vdiffr::expect_doppelganger("geom-col-rounded", p)
})

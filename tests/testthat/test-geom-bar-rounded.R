p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(class)) + geom_bar_rounded()

test_that("geom_bar_rounded() works", {
  vdiffr::expect_doppelganger("geom-bar-rounded", p)
})

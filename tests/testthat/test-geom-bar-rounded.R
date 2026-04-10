p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(class)) + geom_bar_rounded()
p_max <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(class)) +
  geom_bar_rounded(radius = 1)

test_that("geom_bar_rounded() works", {
  vdiffr::expect_doppelganger("geom-bar-rounded", p)
})

test_that("geom_bar_rounded() supports fully rounded corners", {
  vdiffr::expect_doppelganger("geom-bar-rounded-max", p_max)
})

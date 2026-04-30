p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(class)) + geom_bar_rounded()
p_max <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(class)) +
  geom_bar_rounded(radius = 1)
p_horizontal <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(y = class)) +
  geom_bar_rounded(radius = 1)

test_that("geom_bar_rounded() works", {
  vdiffr::expect_doppelganger("geom-bar-rounded", p)
})

test_that("geom_bar_rounded() supports fully rounded corners", {
  vdiffr::expect_doppelganger("geom-bar-rounded-max", p_max)
})

test_that("geom_bar_rounded() supports horizontal bars", {
  built <- ggplot2::ggplot_build(p_horizontal)$data[[1]]

  expect_true(all(built$xmin == 0))
  expect_true(all(built$xmax > 0))
  expect_equal(as.numeric(built$ymin), seq_len(nrow(built)) - 0.45)
  expect_equal(as.numeric(built$ymax), seq_len(nrow(built)) + 0.45)
  expect_s3_class(ggplot2::ggplotGrob(p_horizontal), "gtable")
})

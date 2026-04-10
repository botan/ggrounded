p <- ggplot2::ggplot(faithful, ggplot2::aes(waiting)) +
  geom_histogram_rounded(bins = 10)
p_max <- ggplot2::ggplot(faithful, ggplot2::aes(waiting)) +
  geom_histogram_rounded(bins = 10, radius = 1)

test_that("geom_histogram_rounded() uses the rounded geom", {
  expect_s3_class(p$layers[[1]]$geom, "GeomColRounded")
  expect_s3_class(p$layers[[1]]$stat, "StatBin")
})

test_that("geom_histogram_rounded() forwards binning parameters", {
  expect_equal(p$layers[[1]]$stat_params$bins, 10)
  expect_equal(p_max$layers[[1]]$geom_params$radius, 1)
})

test_that("geom_histogram_rounded() draws without error", {
  expect_no_error(ggplot2::ggplotGrob(p))
})

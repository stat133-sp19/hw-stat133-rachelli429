context("binomial")

test_that("check bin_choose works", {
  expect_equal(bin_choose(5, 2), 10)
  expect_length(bin_choose(5, 2), 1)
  expect_type(bin_choose(5, 2), "double")
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  expect_length(bin_choose(5, 1:3), 3)
  expect_error(bin_choose(3, 4))
})

test_that("check bin_probability works", {
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  expect_length(bin_probability(2, 5, 0.5), 1)
  expect_type(bin_probability(2, 5, 0.5), "double")
  expect_equal(bin_probability(0:2, 5, 0.5), c(0.03125, 0.15625, 0.31250))
  expect_length(bin_probability(0:2, 5, 0.5), 3)
  expect_error(bin_probability(10, -5, 1.2))
})

test_that("check bin_distribution works", {
  expect_is(bin_distribution(5, 0.5), c("bindis", "data.frame"))
  expect_length(bin_distribution(5, 0.5), 2)
  expect_equivalent(bin_distribution(5, 0.5),
                    data.frame(success = 0:5,
                               probability = c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125)
                               )
                    )
})

test_that("check bin_cumulative works", {
  expect_is(bin_cumulative(5, 0.5), c("bincum", "data.frame"))
  expect_length(bin_cumulative(5, 0.5), 3)
  expect_equivalent(bin_cumulative(5, 0.5),
               data.frame(success = 0:5,
                          probability = c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125),
                          cumulative = c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000)
               ))
})

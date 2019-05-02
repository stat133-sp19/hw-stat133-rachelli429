context("summary measures")

test_that("check aux_mean works", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_type(aux_mean(10, 0.3), "double")
  expect_length(aux_mean(10, 0.3), 1)
})

test_that("check aux_variance works", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_type(aux_variance(10, 0.3), "double")
  expect_length(aux_variance(10, 0.3), 1)
})

test_that("check aux_mode works", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_type(aux_mode(10, 0.3), "integer")
  expect_length(aux_mode(10, 0.3), 1)
})

test_that("check aux_skewness works", {
  sk <- (1 - 2 * 0.3) / sqrt(10 * 0.3 * (1 - 0.3))
  expect_equal(aux_skewness(10, 0.3), sk)
  expect_type(aux_skewness(10, 0.3), "double")
  expect_length(aux_skewness(10, 0.3), 1)
})

test_that("check aux_kurtosis works", {
  ku <- (1 - 6 * 0.3 * (1 - 0.3)) / (10 * 0.3 * (1 - 0.3))
  expect_equal(aux_kurtosis(10, 0.3), ku)
  expect_type(aux_kurtosis(10, 0.3), "double")
  expect_length(aux_kurtosis(10, 0.3), 1)
})

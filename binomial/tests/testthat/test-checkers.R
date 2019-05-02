context("checker functions")

test_that("check_prob works", {
  expect_true(check_prob(0.5))
  expect_length(check_prob(0.5), 1)
  expect_error(check_prob(3))
  expect_type(check_prob(0.5), "logical")
})

test_that("check_trials works", {
  expect_true(check_trials(5))
  expect_length(check_trials(5), 1)
  expect_error(check_trials(-5))
  expect_type(check_trials(5), "logical")
})

test_that("check_success works", {
  expect_true(check_success(1:5, 6))
  expect_length(check_success(1:5, 6), 1)
  expect_error(check_success(1:5, 4))
  expect_error(check_success(-3, 4))
  expect_type(check_success(1:5, 6), "logical")
})

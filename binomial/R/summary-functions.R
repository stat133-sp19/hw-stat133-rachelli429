#' @title bin_mean
#' @description computes mean of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success on each trial (numeric)
#' @return mean of binomial distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title bin_variance
#' @description computes variance of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success on each trial (numeric)
#' @return variance of binomial distribution
#' @export
#' @examples
#' bin_variance(10, 0.3)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title bin_mode
#' @description computes mode of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success on each trial (numeric)
#' @return mode of binomial distribution
#' @export
#' @examples
#' bin_mode(10, 0.3)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title bin_skewness
#' @description computes skewness of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success on each trial (numeric)
#' @return skewness of binomial distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}

#' @title bin_kurtosis
#' @description computes kurtosis of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success on each trial (numeric)
#' @return kurtosis of binomial distribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}
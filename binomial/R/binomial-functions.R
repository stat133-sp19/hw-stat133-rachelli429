#source("checker-functions.R")
#source("auxiliary-functions.R")

#' @title bin_choose
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n number of trials (numeric)
#' @param k number of successes (numeric vector)
#' @return number of combinations
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
bin_choose <- function(n, k) {
  if (any(k > n)) {
    stop('k cannot be greater than n')
  } else {
    factorial(n) / (factorial(k) * factorial(n - k))
  }
}

#' @title bin_probability
#' @description computes the probability of getting k successes in n trials with probability of success prob
#' @param success number of successes (numeric vector)
#' @param trials number of trials (numeric)
#' @param prob probability of success on each trial (numeric)
#' @return computed probability
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(0:2, 5, 0.5)
#' bin_probability(55, 100, 0.45)
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  bin_choose(trials, success) * prob ^ success * (1 - prob) ^ (trials - success)
}

#' @title bin_distribution
#' @description returns a data frame with the probability distribution of class "bindis"
#' @param trials number of trials (numeric)
#' @param prob probability of success on each trial (numeric)
#' @return data frame with the probability distribution
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
bin_distribution <- function(trials, prob) {
  success <- 0:trials
  probability <- bin_probability(0:trials, trials, prob)
  df <- data.frame(success, probability)
  class(df) = c("bindis", "data.frame")
  return(df)
}

#' @export
plot.bindis <- function(x, ...) {
  barplot(x$probability, main = "histogram of binomial distribution",
          xlab = "successes", ylab = "probability",
          names.arg = x$success)
}

#' @title bin_cumulative
#' @description returns a data frame with the probability distribution & cumulative probabilities, of class "bincum"
#' @param trials number of trials (numeric)
#' @param prob probability of success on each trial (numeric)
#' @return data frame with probability distribution & cumulative probabilities
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative <- function(trials, prob) {
  distrib <- bin_distribution(trials, prob)
  probability <- distrib$probability
  cumulative <- c(probability[1])
  for (i in 2:length(probability)) {
    cumulative[i] <- cumulative[i - 1] + probability[i]
  }
  result <- data.frame(distrib, cumulative)
  class(result) = c("bincum", "data.frame")
  return(result)
}

#' @export
plot.bincum <- function(x, ...) {
  plot(x$cumulative, type = "o",
       main = "plot of cumulative distribution",
       xlab = "successes", ylab = "probability",)
}

#' @title bin_variable
#' @description return list with number of trials (trials) & probability of success (prob), of class "binvar"
#' @param trials number of trials (numeric)
#' @param prob probability of success on each trial (numeric)
#' @return list with number of trials & probability of success
#' @export
#' @examples
#' bin_variable(trials = 10, prob = 0.3)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  result <- list(trials = trials,
                 prob = prob)
  class(result) = "binvar"
  return(result)
}

#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial Variable"\n\nParameters\n- number of trials: ', x$trials,
      "\n- prob of success: ", x$prob)
}

#' @export
summary.binvar <- function(x, ...) {
  trials <- x$trials
  prob <- x$prob
  result <- list(
    trials = trials,
    prob = prob,
    mean = aux_mean(trials, prob),
    variance = aux_variance(trials, prob),
    mode = aux_mode(trials, prob),
    skewness = aux_skewness(trials, prob),
    kurtosis = aux_kurtosis(trials, prob)
  )
  class(result) = "summary.binvar"
  return(result)
}

#' @export
print.summary.binvar <- function(x, ...) {
  cat('"Summary Binomial"\n\nParameters\n- number of trials: ', x$trials,
      "\n- prob of success: ", x$prob,
      "\n\nMeasures\n- mean: ", x$mean,
      "\n- variance: ", x$variance,
      "\n- mode: ", x$mode,
      "\n- skewness: ", x$skewness,
      "\n- kurtosis: ", x$kurtosis
      )
}

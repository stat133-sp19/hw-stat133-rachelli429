# private function to compute mean
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# private function to compute variance
aux_variance <- function(trials, prob) {
  (trials * prob) * (1 - prob)
}

# private function to compute mode
aux_mode <- function(trials, prob) {
  m <- trials * prob + prob
  if (as.integer(m) == m) {
    return(c(m, m - 1))
  } else {
    return(as.integer(m))
  }
}

# private function to compute skewness
aux_skewness <- function(trials, prob) {
  (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
}

# private function to compute kurtosis
aux_kurtosis <- function(trials, prob) {
  (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
}


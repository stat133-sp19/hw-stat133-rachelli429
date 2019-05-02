# private function to check if an input is a valid probability value
check_prob <- function(prob) {
  if (prob >= 0 & prob <= 1) {
    return(TRUE)
  } else {
    stop('prob must be a number between 0 and 1')
  }
}

# private function to check if an input is a valid value for number of trials
check_trials <- function(trials) {
 if (trials >= 0) {
   return(TRUE)
 } else {
   stop('trials must be a non-negative integer')
 }
}

# private function to check if an input is a value value for number of successes
check_success <- function(success, trials) {
  if (all(success >= 0 & success <= trials)) {
    TRUE
  } else if (any(success > trials)) {
    stop('success cannot be greater than trials')
  } else if (any(success < 0)) {
    stop('success must be a non-negative integer')
  }
}

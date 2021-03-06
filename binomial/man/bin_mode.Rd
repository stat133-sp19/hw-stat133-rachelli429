% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary-functions.R
\name{bin_mode}
\alias{bin_mode}
\title{bin_mode}
\usage{
bin_mode(trials, prob)
}
\arguments{
\item{trials}{number of trials (numeric)}

\item{prob}{probability of success on each trial (numeric)}
}
\value{
mode of binomial distribution
}
\description{
computes mode of binomial distribution
}
\examples{
bin_mode(10, 0.3)
bin_mode(7, 0.5)
}

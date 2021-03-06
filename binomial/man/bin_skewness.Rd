% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary-functions.R
\name{bin_skewness}
\alias{bin_skewness}
\title{bin_skewness}
\usage{
bin_skewness(trials, prob)
}
\arguments{
\item{trials}{number of trials (numeric)}

\item{prob}{probability of success on each trial (numeric)}
}
\value{
skewness of binomial distribution
}
\description{
computes skewness of binomial distribution
}
\examples{
bin_skewness(10, 0.3)
}

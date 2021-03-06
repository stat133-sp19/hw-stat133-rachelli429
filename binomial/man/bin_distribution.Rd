% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial-functions.R
\name{bin_distribution}
\alias{bin_distribution}
\title{bin_distribution}
\usage{
bin_distribution(trials, prob)
}
\arguments{
\item{trials}{number of trials (numeric)}

\item{prob}{probability of success on each trial (numeric)}
}
\value{
data frame with the probability distribution
}
\description{
returns a data frame with the probability distribution of class "bindis"
}
\examples{
bin_distribution(trials = 5, prob = 0.5)
}

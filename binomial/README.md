---
title: "README"
author: "Rachel Li"
date: "5/2/2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Overview

`binomial` is an R package that provides functions to perform various calculations related to the binomial distribution.

**Binomial Functions**:

* `bin_choose()` calculates the number of combinations in which *k* successes can occur in *n* trials
* `bin_probability()` computes the probability of getting *k* successes in *n* trials with probability of success *prob*
* `bin_distribution()` returns a data frame with the probability distribution of class `"bindis"`
  + `plot()` method to plot probability histogram 
* `bin_cumulative()` returns a data frame with the probability distribution & cumulative probabilities, of class `"bincum"`
  + `plot()` method to graph cumulative distribution
* `bin_variable()` returns a list with number of trials (trials) & probability of success (prob), of class `"binvar"`
  + `print()` method 
  + `summary.binvar()` method
  + `print.summary.binvar()` method

**Summary Measures**: 

* `bin_mean()`
* `bin_variance()`
* `bin_mode()`
* `bin_skewness()`: computes measure of the asymmetry of the probability distribution of a random variable about its mean
* `bin_kurtosis()`: computes measure of the "tailedness" of the probability distribution of a random variable 

# Motivation 

The package has been developed to simplify calculations related to the binomial distribution. 

# Installation

Install the development version from GitHub via the package `"devtools"`:

```{r}
# development version from GitHub:
install.packages("devtools")

# install "binomial"
devtools::install_github("stat133-sp19/hw-stat133-rachelli429/tree/master/binomial", build_vignettes = TRUE)
```

# Usage 

```{r}
library(binomial)
```

**Binomial Functions**:

```{r}
# number of combinations of getting 2 successes in 5 trials
bin_choose(n = 5, k = 2)
#> 10
#>
#> trials: 5
#> successes: 2

# probability of getting 2 successes in 5 trials
bin_probability(success = 2, trials = 5, prob = 0.5)
#> 0.3125

# object of class "bindis"
dis1 <- bin_distribution(trials = 5, prob = 0.5)
#> success probability
#>    0     0.03125
#>    1     0.15625
#>    2     0.31250
#>    3     0.31250
#>    4     0.15625
#>    5     0.03125

# histogram of binomial distribution
plot(dis1)

# object of class "bincum"
dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#> success probability cumulative
#>    0     0.03125     0.03125
#>    1     0.15625     0.18750
#>    2     0.31250     0.50000
#>    3     0.31250     0.81250
#>    4     0.15625     0.96875
#>    5     0.03125     1.0000

# plot of cumulative distribution
plot(dis2)

# object of class "binvar" with named elements "trials" and "prob"
bin1 <- bin_variable(trials = 10, p = 0.3)
#> "Binomial Variable"
#> 
#> Parameters
#> - number of trials: 10
#> - prob of success: 0.3

summary(bin1)
#> "Summary Binomial"
#> 
#> Parameters
#> - number of trials: 10
#> - prob of success: 0.3
#> 
#> Measures
#> - mean: 3
#> - variance: 2.1
#> - mode: 3
#> - skewness: 0.2760262
#> - kurtosis: -0.1238095
```

**Summary Measures**:

```{r}
#> trials: 10
#> probability of success: 0.3 

bin_mean(10, 0.3)
#> 3

bin_variance(10, 0.3)
#> 2.1

bin_mode(10, 0.3)
#> 3

bin_skewness(10, 0.3)
#> 0.2760262

bin_kurtosis(10, 0.3)
#> -0.1238095
```

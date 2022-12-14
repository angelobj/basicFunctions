% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basicFunctions.R
\name{find_diffs}
\alias{find_diffs}
\title{Function to find elements in 'x' greater than the treshold 'tsh' for shading SPM.}
\usage{
find_diffs(x, tsh)

find_diffs(x, tsh)
}
\arguments{
\item{x}{Vector}

\item{tsh}{Numeric variable}
}
\description{
Function to find elements in 'x' greater than the treshold 'tsh' for shading SPM.

Function to find elements in 'x' greater than the treshold 'tsh' for shading SPM.
}
\examples{
x<-sin(seq(0,pi,by=0.1));plot(x)
find_diffs(x,0.8)
abline(v = find_diffs(x,0.8), col="red", lwd=3, lty=2)
abline(h = 0.8, col="blue", lwd=3, lty=2)
x<-sin(seq(0,pi,by=0.1));plot(x)
find_diffs(x,0.8)
abline(v = find_diffs(x,0.8), col="red", lwd=3, lty=2)
abline(h = 0.8, col="blue", lwd=3, lty=2)
}

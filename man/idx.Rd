% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basicFunctions.R
\name{idx}
\alias{idx}
\alias{\%idx\%}
\title{Function to find intersect of 'x' and 'y'.}
\usage{
x \%idx\% y
}
\arguments{
\item{x}{Vector to look for}

\item{y}{Elements to exclude from 'x'}
}
\description{
Function to find intersect of 'x' and 'y'.
}
\examples{
x<-c(1,2,3);y<-c(3)
x \%idx\% y
}
\keyword{!in}

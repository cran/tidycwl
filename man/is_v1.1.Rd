% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{is_v1.1}
\alias{is_v1.1}
\title{Is this CWL v1.1?}
\usage{
is_v1.1(x)
}
\arguments{
\item{x}{CWL object}
}
\value{
Logical. \code{TRUE} if it is a CWL v1.1 object, \code{FALSE} if not.
}
\description{
Is this CWL v1.1?
}
\examples{
system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") \%>\%
  read_cwl(format = "json") \%>\%
  is_v1.1()
}

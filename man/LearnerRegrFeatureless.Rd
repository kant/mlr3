% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LearnerRegrFeatureless.R
\docType{data}
\name{LearnerRegrFeatureless}
\alias{LearnerRegrFeatureless}
\alias{mlr_learners_regr.featureless}
\title{Featureless Regression Learner}
\format{\link[R6:R6Class]{R6::R6Class} inheriting from \link{LearnerRegr}.}
\description{
A simple \link{LearnerRegr} which only analyses the response during train, ignoring all features.
If hyperparameter \code{robust} is \code{FALSE} (default), constantly predicts \code{mean(y)} as response
and \code{sd(y)} as standard error.
If \code{robust} is \code{TRUE}, \code{median()} and \code{madn()} are used instead of \code{mean()} and \code{sd()},
respectively.
}
\section{Construction}{
\preformatted{LearnerRegrFeatureless$new()
mlr_learners$get("regr.featureless")
lrn("regr.featureless")
}
}

\seealso{
\link[mlr3misc:Dictionary]{Dictionary} of \link[=Learner]{Learners}: \link{mlr_learners}
}
\keyword{datasets}

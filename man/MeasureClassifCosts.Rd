% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MeasureClassifCosts.R
\docType{data}
\name{MeasureClassifCosts}
\alias{MeasureClassifCosts}
\alias{mlr_measures_classif.costs}
\title{Cost-sensitive Classification Measure}
\format{\code{\link[R6:R6Class]{R6::R6Class()}} inheriting from \link{MeasureClassif}.}
\description{
Uses a cost matrix to create a classification measure.
True labels must be arranged in columns, predicted labels must be arranged  in rows.
The cost matrix is stored as slot \code{$costs}.
Costs are aggregated with the mean.
}
\section{Construction}{
\preformatted{MeasureClassifCosts$new(costs = NULL, normalize = TRUE)
mlr_measures$get("classif.costs")
msr("classif.costs")
}
\itemize{
\item \code{costs} :: \code{matrix()}\cr
Numeric matrix of costs (truth in columns, predicted response in rows).
\item \code{normalize} :: \code{logical(1)}\cr
If \code{TRUE}, calculate the mean costs instead of the total costs.
}
}

\examples{
# get a cost sensitive task
task = tsk("german_credit")

# cost matrix as given on the UCI page of the german credit data set
# https://archive.ics.uci.edu/ml/datasets/statlog+(german+credit+data)
costs = matrix(c(0, 5, 1, 0), nrow = 2)
dimnames(costs) = list(truth = task$class_names, predicted = task$class_names)
print(costs)

# mlr3 needs truth in columns, predictions in rows
costs = t(costs)

# create measure which calculates the absolute costs
m = msr("classif.costs", id = "german_credit_costs", costs = costs, normalize = FALSE)

# fit models and calculate costs
learner = lrn("classif.rpart")
rr = resample(task, learner, rsmp("cv", folds = 3))
rr$aggregate(m)
}
\seealso{
\link[mlr3misc:Dictionary]{Dictionary} of \link[=Measure]{Measures}: \link{mlr_measures}
}
\keyword{datasets}

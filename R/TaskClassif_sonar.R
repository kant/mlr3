#' @title Sonar Classification Task
#'
#' @name mlr_tasks_sonar
#' @format [R6::R6Class] inheriting from [TaskClassif].
#' @include mlr_tasks.R
#'
#' @section Construction:
#' ```
#' mlr_tasks$get("sonar")
#' tsk("sonar")
#' ```
#'
#' @description
#' A classification task for the [mlbench::Sonar] data set.
#' Positive class is set to "M" (Mine).
#'
#' @template seealso_task
NULL

load_task_sonar = function(id = "sonar") {
  b = as_data_backend(load_dataset("Sonar", "mlbench"))
  b$hash = "_mlr3_tasks_sonar_"
  TaskClassif$new(id, b, target = "Class", positive = "M")
}

#' @include mlr_tasks.R
mlr_tasks$add("sonar", load_task_sonar)

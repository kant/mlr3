context("parallelization")

test_that("parallel resample", {
  skip_if_not_installed("future")
  skip_if_not_installed("future.callr")

  with_future(future.callr::callr, {
    expect_true(use_future())

    task = tsk("iris")
    learner = lrn("classif.rpart")

    rr = resample(task, learner, rsmp("cv", folds = 3))
    expect_resample_result(rr)
    expect_data_table(rr$errors, nrows = 0L)
  })
})

test_that("parallel benchmark", {
  skip_if_not_installed("future")
  skip_if_not_installed("future.callr")

  with_future(future.callr::callr, {
    expect_true(use_future())

    task = tsk("iris")
    learner = lrn("classif.rpart")

    bmr = benchmark(benchmark_grid(task, learner, rsmp("cv", folds = 3)))
    expect_benchmark_result(bmr)
    expect_equal(bmr$aggregate(warnings = TRUE)$warnings, 0L)
    expect_equal(bmr$aggregate(errors = TRUE)$errors, 0L)
  })
})

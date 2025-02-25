test_that("dracula_brand copies _brand.yaml to the specified directory", {
  temp_dir <- tempdir()
  expect_message(
    expect_true(dracula_brand(path = temp_dir, force = TRUE))
  )
  expect_true(file.exists(file.path(temp_dir, "_brand.yaml")))
})

test_that("dracula_brand does not overwrite", {
  temp_dir <- tempdir()
  file.create(file.path(temp_dir, "_brand.yaml"))
  expect_message(
    expect_false(dracula_brand(path = temp_dir, force = FALSE))
  )
})

test_that("_brand.yaml in inst is valid YAML", {
  package_path <- system.file("_brand.yaml", package = "dRacula", mustWork = TRUE)
  expect_true(file.exists(package_path))
  expect_silent(yaml::read_yaml(package_path))
})

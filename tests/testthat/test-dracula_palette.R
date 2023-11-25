

test_that("palette is correct number of colors", {
  expect_length(dracula_discrete_bright_palette(), 7)
  expect_length(dracula_discrete_bright_palette(1), 1)
})

test_that("dracula_discrete_bright_palette() cannot return more than 7", {
  expect_error(dracula_discrete_bright_palette(8))
})

test_that("palette is correct number of colors", {
  expect_length(dracula_palette(), 7)
})

test_that("palette contains right colors", {
  expect_setequal(
    dracula_palette(),
    c("#FF5555", "#FFB86C", "#F1FA8C", "#50FA7B", "#BD93F9", "#8BE9FD", "#FF79C6")
  )
})

test_that("dracula_palette() returns less than total number of discrete colors", {
  expect_length(dracula_palette(num_cols = 5, var_type = "discrete"), 5)
})

test_that("dracula_palette() returns more than total number of discrete colors", {
  expect_length(dracula_palette(num_cols = 10, var_type = "discrete"), 10)
})

test_that("dracula_palette() returns a continuous ramp equal to the standard palette if num_cols=7", {
  expect_identical(
    dracula_palette(num_cols = 7, var_type = "continuous"),
    dracula_palette()
  )
})

test_that("dracula_palette() returns less than total number of colors as a continuous ramp", {
  expect_length(
    dracula_palette(num_cols = 5, var_type = "continuous"), 5)
})

test_that("dracula_palette() can return more than total number of colors as a continuous ramp", {
  expect_length(
    dracula_palette(num_cols = 20, var_type = "continuous"), 20)
})

test_that("first value in dracula_palette() continuous ramp is first value in standard palette", {
  expect_identical(
    dracula_palette(num_cols = 20, var_type = "continuous")[1],
    dracula_palette(num_cols = 1)[1]
  )
})

test_that("last value in dracula_palette() continuous ramp is last value in standard palette", {
  expect_identical(
    dracula_palette(num_cols = 20, var_type = "continuous")[20],
    dracula_palette()[length(dracula_palette())]
  )
})


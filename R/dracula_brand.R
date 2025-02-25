#' @title Dracula Themed _brand.yaml File
#'
#' @description Add a Dracula-themed `_brand.yaml` to your project.
#'
#' @param path Character. The directory where `_brand.yaml` should be copied. Defaults to the working directory.
#'
#' @param force Boolean. If `TRUE`, overwrite existing `_brand.yaml` without prompting. Defaults to `FALSE`.
#'
#' @return Logical. Returns `TRUE` if the file was copied successfully, `FALSE` otherwise.
#'
#' @examples
#' # Copy _brand.yaml to the current working directory
#' dracula_brand()
#'
#' # Copy _brand.yaml to a specific directory
#' dracula_brand(path = "my_project")
#'
#' # Force overwrite if _brand.yaml already exists
#' dracula_brand(force = TRUE)
#'
#' @export
dracula_brand <- function(path = ".", force = FALSE) {
  package_path <- system.file("_brand.yaml", package = "dRacula", mustWork = TRUE)
  target_path <- file.path(path, "_brand.yaml")

  if (file.exists(target_path)) {
    if (!force) {
      message("_brand.yaml already exists. Set `force = TRUE` to overwrite")
      return(invisible(FALSE))
    }
  }

  file.copy(package_path, target_path, overwrite = TRUE)
  message("_brand.yaml copied to ", target_path)
  return(invisible(TRUE))
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dracula_brand.R
\name{dracula_brand}
\alias{dracula_brand}
\title{Dracula Themed _brand.yaml File}
\usage{
dracula_brand(path = ".", force = FALSE)
}
\arguments{
\item{path}{Character. The directory where \verb{_brand.yaml} should be copied. Defaults to the working directory.}

\item{force}{Boolean. If \code{TRUE}, overwrite existing \verb{_brand.yaml} without prompting. Defaults to \code{FALSE}.}
}
\value{
Logical. Returns \code{TRUE} if the file was copied successfully, \code{FALSE} otherwise.
}
\description{
Add a Dracula-themed \verb{_brand.yaml} to your project.
}
\examples{
# Copy _brand.yaml to the current working directory
dracula_brand()

# Copy _brand.yaml to a specific directory
dracula_brand(path = "my_project")

# Force overwrite if _brand.yaml already exists
dracula_brand(force = TRUE)

}

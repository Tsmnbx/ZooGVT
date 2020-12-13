#' launch a Shiny App for ZooGVT
#'
#' A function that launches the Shiny app for this package
#'The code has been placed in \code{./inst/shiny-scripts} in a file called app.R
#'
#' @return This function just to run the Shiny page for this app and has no return values
#' @export
#'
#' @examples
#' \dontrun{
#'
#' ZooGVT::runZooGVT()
#' }
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials. \href{https://shiny.rstudio.com/tutorial/}{Link}
#' Anjali Silva (2020). TestingPackage \href{https://github.com/anjalisilva/TestingPackage/}{Link}

runZooGVT <- function() {
  appDir <- system.file("shiny-scripts",
                        package = "ZooGVT")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}

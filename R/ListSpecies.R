#' Show all The animals available from BgeeDB
#'
#'
#'
#' @return A list of species that currently work with this package, they have phenotype descriptions
#' in ensemble but also are in the BgeeDB database of species both are required for this to work
#' @export
#'
#' @examples
#' List<-ListSpecies()
ListSpecies<-function(){
  return(ZooGVT::Species)
}


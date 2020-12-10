#' Show all The animals available from BgeeDB
#'
#'
#'
#' @return A list of species
#' @export
#'
#' @examples
#' List<-ListSpecies()
ListSpecies<-function(){
  ID <- BgeeDB::listBgeeSpecies()["ID"]
  GENUS <- BgeeDB::listBgeeSpecies()["GENUS"]
  SPECIES_NAME <- BgeeDB::listBgeeSpecies()["SPECIES_NAME"]
  SpeciesList <- cbind(ID, GENUS, SPECIES_NAME)
  return(SpeciesList)
}


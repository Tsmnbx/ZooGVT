#' Title
#'
#' @param listOfSpecies the Vector containing Species you want for a feature
#' @param feature The feature that you want to see
#'
#' @return Does not return only shows the plots
#' @export
#'
#' @examples
#' \dontrun{
#'GeneAnatomyParty("Danio_rerio","Zebrafish","pectoral fin")
#'ListofAnimals<-c("Zebrafish","Human")
#'GeneAnatomyParty(ListofAnimals,"blood")
#'
#'
#'
#'}
#' @import fmsb
#' @import BgeeDB
#' @import biomaRt
#' @import topGO
#' @importFrom utils head
#' @import grDevices


GeneAnatomyParty<-function(listOfSpecies, feature){
  for (i in seq(along = listOfSpecies)){
    species<-listOfSpecies[i]
    nameVector<-getRelevantNameVector(species)
    common<-nameVector[1]
    sci<-nameVector[2]
    plot<-GenesFromAnatomy(sci, common, feature)

  }
}




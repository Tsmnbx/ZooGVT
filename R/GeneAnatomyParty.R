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

getRelevantNameVector<-function(name){
  indexComm<-match(name,Species$Common_Name)
  indexSci<-match(name,Species$Scientific_Name)
  names<-c()

  if(is.na(indexComm)== FALSE){
    index<-indexComm
    names<-append(names,Species$Common_Name[index])
    names<-append(names,Species$Scientific_Name[index])
    return(names)
  }

  if(is.na(indexSci)== FALSE){
    index<-indexSci
    names<-append(names,Species$Common_Name[index])
    names<-append(names,Species$Scientific_Name[index])
    return(names)
  }

}

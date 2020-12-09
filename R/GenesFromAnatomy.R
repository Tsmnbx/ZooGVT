
GenesFromAnatomy<-function(speciesBgee, speciesCommon, feature){
  dataframe<-data.frame(row.names=1:1)
  topData<-TopData(speciesBgee)
  print(speciesBgee)

  geneList<-CreateGeneList(speciesCommon, feature)

  print(head(geneList))

  topObject<-TopObj(topData, geneList)
  print("After topObj")
  results <- BgeeDB::runTest(topObject, algorithm = 'weight', statistic = 'fisher')
  table<- Table(topData, topObject, results)
  for (i in seq_along(table$annotated)){

    organData<-data.frame(c(table$annotated[i]))
    colnames(organData) <- c(table$organName[i])
    print(organData)
    dataframe<-cbind(dataframe, organData)
    print("total anno loop added")
    print(table$organName)
  }

  print("graph stuff")
  max<-max(dataframe[1,])
  min<-min(dataframe[1,])
  rowLength<-length(dataframe[1,])
  radData <- rbind(rep(max,rowLength) , rep(min,rowLength) , dataframe)
  graph<- fmsb::radarchart(radData)
  return(graph)

}

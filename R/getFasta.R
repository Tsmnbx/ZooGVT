getFasta <- function(nameOfFile){
  Dna <- seqinr::read.fasta(file = nameOfFile)
  return(Dna)
}

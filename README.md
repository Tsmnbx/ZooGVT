
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ZooGVT

<!-- badges: start -->

<!-- badges: end -->

The goal of ZooGVT is to visualize and understand what genes give rise
or contribute to what anatomical features. The user is able to see what
adjective they use as a feature for a animals in the BgeeDB database
that have phenotype descriptions in Ensemble.

## Description

ZooGVT allows users to visualize the various anatomical features related
to a set of genes. This gives a better map of how certain genes
translate into the animal features. These Genes can alter be extracted
to compare differences between species. THis package allows easier
access to the Uberon Ontolgy and aids in its use.

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Tsmnbx/ZooGVT")
```

## Example

This is a basic example which shows the UBERONids on could get for a
Zebra fish with the descriptor “pectoral fin”:

``` r
library(ZooGVT)
#> 
#BiocManager::install("topGO")

IdDataFrame<-ZooGVT::GetUberonIds("Danio_rerio","Zebrafish","pectoral fin")
#> 
#> NOTE: You did not specify any data type. The argument dataType will be set to c("rna_seq","affymetrix","est","in_situ") for the next steps.
#> 
#> Querying Bgee to get release information...
#> 
#> NOTE: the file describing Bgee species information for release 14_1 was found in the download directory /Users/joshuaefe/Documents/COURSES_FALL_2020/BCB410/Package/ZooGVT. Data will not be redownloaded.
#> 
#> API key built: 38de08b817d9692a0b7b6af33a0f4d41f7e6d7a932742446063b9e181664fe25b6274fd73369b6db4dca591449aa87168475489061073e776aa104c47ea0b90f
#> 
#> NOTE: an organ relationships file was found in the download directory /Users/joshuaefe/Documents/COURSES_FALL_2020/BCB410/Package/ZooGVT/Danio_rerio_Bgee_14_1. Data will not be redownloaded.
#> 
#> NOTE: an organ names file was found in the download directory /Users/joshuaefe/Documents/COURSES_FALL_2020/BCB410/Package/ZooGVT/Danio_rerio_Bgee_14_1. Data will not be redownloaded.
#> 
#> NOTE: a gene to organs mapping file was found in the download directory /Users/joshuaefe/Documents/COURSES_FALL_2020/BCB410/Package/ZooGVT/Danio_rerio_Bgee_14_1. Data will not be redownloaded.
#> 
#> Parsing the results.............................................
#> 
#> Adding BGEE:0 as unique root of all terms of the ontology.......
#> 
#> Done.
#> [1] "Danio_rerio"
#> [1] "drerio_gene_ensembl"
#> ENSDARG00000020201 ENSDARG00000012892 ENSDARG00000008788 ENSDARG00000013174 
#>                  0                  0                  0                  0 
#> ENSDARG00000021899 ENSDARG00000037429 
#>                  0                  0 
#> Levels: 0 1
#> 
#> Checking topAnatData object.............
#> 
#> Checking gene list......................
#> 
#> WARNING: Some genes in your gene list have no expression data in Bgee, and will not be included in the analysis. 4008 genes in background will be kept.
#> 
#> Building most specific Ontology terms...  (  1191  Ontology terms found. )
#> 
#> Building DAG topology...................  (  2055  Ontology terms and  3917  relations. )
#> 
#> Attaching package: 'SparseM'
#> The following object is masked from 'package:base':
#> 
#>     backsolve
#> 
#> Annotating nodes (Can be long)..........  (  4008  genes annotated to the Ontology terms. )
#> [1] "After topObj"
#> 
#>           -- Weight Algorithm -- 
#> 
#>       The algorithm is scoring 1020 nontrivial nodes
#>       parameters: 
#>           test statistic: fisher : ratio
#> 
#>   Level 27:  1 nodes to be scored.
#> 
#>   Level 26:  2 nodes to be scored.
#> 
#>   Level 25:  2 nodes to be scored.
#> 
#>   Level 24:  4 nodes to be scored.
#> 
#>   Level 23:  4 nodes to be scored.
#> 
#>   Level 22:  6 nodes to be scored.
#> 
#>   Level 21:  4 nodes to be scored.
#> 
#>   Level 20:  8 nodes to be scored.
#> 
#>   Level 19:  24 nodes to be scored.
#> 
#>   Level 18:  22 nodes to be scored.
#> 
#>   Level 17:  27 nodes to be scored.
#> 
#>   Level 16:  43 nodes to be scored.
#> 
#>   Level 15:  68 nodes to be scored.
#> 
#>   Level 14:  63 nodes to be scored.
#> 
#>   Level 13:  76 nodes to be scored.
#> 
#>   Level 12:  97 nodes to be scored.
#> 
#>   Level 11:  120 nodes to be scored.
#> 
#>   Level 10:  114 nodes to be scored.
#> 
#>   Level 9:   91 nodes to be scored.
#> 
#>   Level 8:   75 nodes to be scored.
#> 
#>   Level 7:   67 nodes to be scored.
#> 
#>   Level 6:   44 nodes to be scored.
#> 
#>   Level 5:   27 nodes to be scored.
#> 
#>   Level 4:   20 nodes to be scored.
#> 
#>   Level 3:   6 nodes to be scored.
#> 
#>   Level 2:   4 nodes to be scored.
#> 
#>   Level 1:   1 nodes to be scored.
#> 
#> Building the results table for the 29 significant terms at FDR threshold of 0.01...
#> Ordering results by pValue column in increasing order...
#> Done
IdDataFrame
#>       UBERONids        AnatFeature                      
#>  [1,] "UBERON:0000151" "pectoral fin"                   
#>  [2,] "UBERON:0004357" "paired limb/fin bud"            
#>  [3,] "UBERON:2000040" "median fin fold"                
#>  [4,] "UBERON:0003051" "ear vesicle"                    
#>  [5,] "UBERON:0003933" "cranial cartilage"              
#>  [6,] "UBERON:0005729" "pectoral appendage field"       
#>  [7,] "UBERON:0003406" "cartilage of respiratory system"
#>  [8,] "UBERON:0004376" "fin bone"                       
#>  [9,] "UBERON:0001042" "chordate pharynx"               
#> [10,] "UBERON:0003108" "suspensorium"                   
#> [11,] "UBERON:0002539" "pharyngeal arch"                
#> [12,] "UBERON:0004756" "dermal skeletal element"        
#> [13,] "UBERON:0003128" "cranium"                        
#> [14,] "UBERON:0006068" "bone of tail"                   
#> [15,] "UBERON:0004375" "bone of free limb or fin"       
#> [16,] "UBERON:0008895" "splanchnocranium"               
#> [17,] "UBERON:0000089" "hypoblast (generic)"            
#> [18,] "UBERON:0010312" "immature eye"                   
#> [19,] "UBERON:0001003" "skin epidermis"                 
#> [20,] "UBERON:0000926" "mesoderm"                       
#> [21,] "UBERON:0002514" "intramembranous bone"           
#> [22,] "UBERON:0002616" "regional part of brain"         
#> [23,] "UBERON:0010363" "endochondral element"           
#> [24,] "UBERON:4000163" "anal fin"                       
#> [25,] "UBERON:2000555" "opercular flap"                 
#> [26,] "UBERON:4000170" "median fin skeleton"            
#> [27,] "UBERON:0002541" "germ ring"                      
#> [28,] "UBERON:2007029" "hindbrain neural keel"          
#> [29,] "UBERON:2007031" "anterior neural rod"
```

To run the Shiny app

``` r
runZooGVT()
```

Here is the package structure

## Contributions

The *ListSpecies* Function uses the BgeeDB package. The *GetUberonIds*
function also made use of the BgeeDB package which uses topGO as well as
the biomaRt for access to Ensembl. *GenesFromAnatomy* used all of these
plus fmsb to produce a radar graph.

## References

Komljenovic A, Roux J, Robinson-Rechavi M, and Bastian F (2016). BgeeDB,
an R package for retrieval of curated expression datasets and for gene
list enrichment tests. F1000Research

Bastian F et al. (2008). Bgee: Integrating and Comparing Heterogeneous
Transcriptome Data Among Species. Data Integration Life Sci. Lecture
Notes in Computer Science, 5109, 124-31

Charif, D. and Lobry, J.R. (2007)

Martin Morgan (2019). BiocManager: Access the Bioconductor Project
Package Repository. R package version 1.30.10.
<https://CRAN.R-project.org/package=BiocManager>

Mapping identifiers for the integration of genomic datasets with the
R/Bioconductor package biomaRt. Steffen Durinck, Paul T. Spellman, Ewan
Birney and Wolfgang Huber, Nature Protocols 4, 1184-1191 (2009).

BioMart and Bioconductor: a powerful link between biological databases
and microarray data analysis. Steffen Durinck, Yves Moreau, Arek
Kasprzyk, Sean Davis, Bart De Moor, Alvis Brazma and Wolfgang Huber,
Bioinformatics 21, 3439-3440 (2005).

Minato Nakazawa (2019). fmsb: Functions for Medical Statistics Book with
some Demographic Data. R package version 0.7.0.
<https://CRAN.R-project.org/package=fmsb>

Adrian Alexa and Jorg Rahnenfuhrer (2020). topGO: Enrichment Analysis
for Gene Ontology. R package version 2.42.0.

R Core Team (2020). R: A language and environment for statistical
computing. R Foundation for Statistical Computing, Vienna, Austria. URL
<https://www.R-project.org/>.

“Learn Shiny.” Shiny, shiny.rstudio.com/tutorial/.

Holtz, Yan. “Basic Radar Chart.” – The R Graph Gallery,
www.r-graph-gallery.com/142-basic-radar-chart.html.

Andrea Komljenovic, Julien Roux. BgeeDB, an R Package for Retrieval of
Curated Expression Datasets and for Gene List Enrichment Tests, 27
Oct. 2020,
bioconductor.org/packages/release/bioc/vignettes/BgeeDB/inst/doc/BgeeDB\_Manual.html.

## Acknowledgements

This package was developed as part of an assessment for 2020 BCB410H:
Applied Bioinformatics, University of Toronto, Toronto,CANADA.

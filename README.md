
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

#IdDataFrame<-ZooGVT::GetUberonIds("Danio_rerio","Zebrafish","pectoral fin")
```

## Contributions

The *ListSpecies* Function uses the BgeeDB package. The *GetUberonIds*
function also made use of the BgeeDB function as well as the biomaRt for
access to Ensembl. *GenesFromAnatomy* used all of these plus fmsb to
produce a radar graph.

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

## Acknowledgements

This package was developed as part of an assessment for 2020 BCB410H:
Applied Bioinformatics, University of Toronto, Toronto,CANADA.

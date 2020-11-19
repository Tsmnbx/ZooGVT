test_that("List SPECIES NAME is Column", {
  SPECIES_NAME <- BgeeDB::listBgeeSpecies()["SPECIES_NAME"]
  X<-ListSpecies()
  expect_identical(X["SPECIES_NAME"],SPECIES_NAME)
})

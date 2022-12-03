## test__compute_totals.R

require( tidyverse )                        # I live in the tidyverse.

source("D:/R-Projects/MyExercise/functions/prepare_garmin_data.R")
source("D:/R-Projects/MyExercise/functions/compute_totals.R")

Pooled_Activities <-
  prepare_garmin_data()

Totals <- 
  compute_totals( Pooled_Activities )

Totals

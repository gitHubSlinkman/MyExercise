# test_function__prepare_gramin_data.R

source("D:/R-Projects/MyExercise/functions/prepare_garmin_data.R")
source("D:/R-Projects/MyExercise/functions/display_tibble.R")


Pooled_Activities <-
  prepare_garmin_data()

dim( Pooled_Activities )

display_tibble( Pooled_Activities )

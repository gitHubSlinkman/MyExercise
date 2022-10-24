# test_function__find_all_gramin_csv_files.R

require(here)                               # To locate project directory.
require(library)                            # I live in the tidyverse.

directory <- 
  file.path( here(),
             "data" )

################################################################################
# Define function to be tested.
################################################################################

source("D:/R-Projects/MyExercise/functions/find_all_garmin_csv_files.R")


################################################################################
# Test function.
################################################################################

find_all_garmin_csv_files( directory )

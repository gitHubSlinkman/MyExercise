# test function__read_garmin_csv_file.R

require(here)                               # To locare project directory.
require(tidyverse)                          # I live in the tidyverse.

################################################################################
# Define required functions.
################################################################################

source("D:/R-Projects/MyExercise/functions/find_all_garmin_csv_files.R")
source("D:/R-Projects/MyExercise/functions/read_garmin_csv_file.R")


################################################################################
# Define tested function.
################################################################################

source("D:/R-Projects/MyExercise/functions/read_garmin_csv_file.R")


################################################################################
# Test function
################################################################################

data_directory <-                           # Determine data directory.
  file.path( here(),
             "data" )
  
files <-                                    # Find the files to be read.
  find_all_garmin_csv_files( 
    data_directory )

nf<- length(files)                          # Determine number of files

for( i in 1:nf ){                           # Read and display each file.
  read_garmin_csv_file( files[i])
}





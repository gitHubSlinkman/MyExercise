# build_activities.R
#
################################################################################
# This script reads the Garmin activity files, concatenates them, and saves
# them for latr analysis as well as saVing them for analysis.
################################################################################


################################################################################
# Load require packages and functions.
################################################################################
require( here )                        # Used to determine project location.
require( tidyverse )                   # I live in the tidyverse.
require( lubridate )                   # For date-time processing.
require( flextable )

source("D:/R-Projects/MyExercise/functions/find_all_garmin_csv_files.R")
source("D:/R-Projects/MyExercise/functions/read_garmin_csv_file.R")
source("D:/R-Projects/MyExercise/functions/find_last_pooled_date_time.R")
source("D:/R-Projects/MyExercise/functions/display_tibble.R")
#
#
################################################################################
# Determine path to project data directory.
################################################################################

project_directory <-                  # Determine project location in 
  here()                              # operating system file system.

data_directory <-                     # Build file path to activities data
  file.path( project_directory,       # director.
             "data",
             "activties" )     


################################################################################
# Find all activity files in activities data sub-directory directory.
################################################################################

files <-                              # Build an array to hold full project
  find_all_garmin_csv_files(          # file paths.
    data_directory )

files <-                             # Ensure files in ascending order by 
  sort( files )                      # by date.


################################################################################
# Read first file.
################################################################################

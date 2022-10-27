# test_function__select_columns

require( here )                             # To determine project directory.
require( tidyverse )                        # I live in the tidy verse.
require( lubridate )                        # To manipulate POSIXct dates.
require( stringr )                          # To manipulate strings.

################################################################################
# Define required functions.
################################################################################

source("D:/R-Projects/MyExercise/functions/find_all_garmin_csv_files.R")
source("D:/R-Projects/MyExercise/functions/read_garmin_csv_file.R")
source("D:/R-Projects/MyExercise/functions/select_columns.R")


################################################################################
# Find all garmin csv files.
################################################################################

data_directory <-                                # Build data directory.
  file.path( here(),
             "data" ) 

file_paths <-                                    # Get full file paths
  find_all_garmin_csv_files( data_directory )

file_paths <-                                    # Sort th file paths in
  sort( file_paths,                              # descending order to the
        decreasing = TRUE )                      # most recent is first.

################################################################################
# Read first two files.
################################################################################

Pooled <-                                     # Read first file and select
  read_garmin_csv_file( file_paths[1]) %>%    # columns.
  select_columns()

names( Pooled )

Activities <-                                 # Read second file and select
  read_garmin_csv_file( file_paths[2]) %>%    # columns.
  select_columns()    








# find_all_activity_files.R
#
################################################################################
# This function finds all the activities files in the data directory.
################################################################################
#
################################################################################
# Load require packages.
################################################################################
#
require(tidyverse)                          # I live in the tidyverse.
#
#
################################################################################


find_all_garmin_csv_files <- 
    function( directory )
     {
       files <- 
            list.files(path  = directory, 
                       pattern = ".csv",
                       full.names = TRUE )
        files
    }
    
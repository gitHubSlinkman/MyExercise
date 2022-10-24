## test_all_functions_v001.R

################################################################################
# This script tests all functions
################################################################################


################################################################################
# Load required packages.
################################################################################
#
require(here)                                       # To locate project home.
require(tidyverse)                                  # I live in the tidyverse.
require(flextable)                                  # For table display
#
#
################################################################################
# Find project location, specivy file to be read.
################################################################################
#
home <- here()                                      # Locate project home.
file_name <- "2022-08-30.csv"                             # Read this file
data_file <-                                        # Build data_path
    file.path( home, 
               "data",
               file_name )
data_file
#
#
################################################################################
# rad_garmin_activities_file.
################################################################################

source("D:/R-Projects/MyWalks2/functions/read_garmin_activities_file_v001.R")

activities <-
    read_garmin_activities_file( data_file )
#
#
################################################################################
# Test select_columns.r
################################################################################
#
source("D:/R-Projects/MyWalks2/functions/select_columns.R")

activities1 <-
    select_columns( activities )
colnames(activities1)
activities1
#

################################################################################
# Test: standardize_column_names.R
################################################################################
#
source("D:/R-Projects/MyWalks2/functions/standardize_column_names.R")
#
activities2 <- 
    standardize_column_names(activities1)
colnames(activities2)
activities2
#
#
################################################################################
# Test: convert_hhmm_to_dec_hours( hours, minutes )
################################################################################

source("D:/R-Projects/MyWalks2/functions/convert_hhmm_to_dec_hours.R")

convert_hhmm_to_dec_hours( 0, 0 )
convert_hhmm_to_dec_hours( 0, 1 )
convert_hhmm_to_dec_hours( 1, 2 )
convert_hhmm_to_dec_hours( 2, 5 )
convert_hhmm_to_dec_hours( 3, 12 )
convert_hhmm_to_dec_hours( 4, 24 )
convert_hhmm_to_dec_hours( 11, 30 )
convert_hhmm_to_dec_hours( 24, 60 )
#
#
################################################################################
# Test: add_computed_variables.R
################################################################################

source("D:/R-Projects/MyWalks2/functions/add_computed_variables.R")

activities3 <-
    add_computed_variables( activities2 )

activities3 %>% 
    select( date_time, 
            year, month, 
            day_of_month, 
            hour, minute )
#
#
################################################################################
# 
################################################################################

rm(list = ls())                             # Remove objects so we can test
                                            # test prepare_garmin_data.
#
source("D:/R-Projects/MyWalks2/functions/find_all_files_v001.R")

project <- here()                           # Find project location

directory <- file.path( project, "data" )
directory

file_paths <-                               # Get paths to each file
    list.files(path  =directory, 
               pattern = ".csv",
               full.names = TRUE )

n <- length(file_paths)                    # Determine number of files read.

all_activities <- NULL                     # Build empty array                          
   
for( i in 1:n)
    {
        activity <-                        # Read each file and "--" to NA.
            read_csv(all_activities[i],     
                             na = "--")
        activity <-
            activity %>% 
                arrange( )
    }


################################################################################
# Read Garmin actvity file
################################################################################





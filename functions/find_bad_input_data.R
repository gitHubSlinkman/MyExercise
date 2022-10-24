# find_bad_input_data.R
#
# ##############################################################################
# This R-script find the first bad record in the MyWalks2 input file.
################################################################################
#
#
################################################################################
# Load required packages.
################################################################################
#
require(here)                               # To find project file directory.
require(tidyverse)                          # I livee in the tidyverse.
require(flextable)                          # to display file input.
#
################################################################################
# Specify file name in directory.
################################################################################
#
file_name <-                               # Specify this before running
    "2022-08-30.csv"                  # this script.
file_path <-                          # Build file path.
    file.path( here(),                  # Project directory.
               "data",                  # Data directory.
               file_name )              # Namre if filr.
activities <-                         # Read activities file.
    read_csv( file_path )
problems()
#
################################################################################
# Display first 10 columns of data.
################################################################################
#
#

    activities %>% 
        select( 1:8 ) %>% 
            flextable() %>% 
                width( j = "Date", 
                        2.0, 
                        unit = "in") %>% 
                width( j = "Title",
                           1.50,
                           unit = "in" )
                         
#


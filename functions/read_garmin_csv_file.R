# read_garmin_csv_file.R

require(tidyverse)                          # I live in the file path.

################################################################################
# Define required functions.
################################################################################

source("D:/R-Projects/MyExercise/functions/fix_column_name.R")

read_garmin_csv_file <-
  function( file_path )
  { 
    Activities <-                          # Read file
      read_csv( file_path )
    
    Activities <-                          # Fix column names.
      rename_with( Activities,
                   fix_column_name )
    
    ############################################################################
    # Make Cycling as my favorite activity and change "Cycling to "Triking."
    ############################################################################
    
    Activities <-                         
      Activities %>% 
        mutate( favorite = 
                  ifelse( activity_type == "Cycling",
                           TRUE,
                           FALSE ),
                  activity_type =
                   ifelse( activity_type == "Cycling",
                           "Triking", activity_type ))
    
    ############################################################################
    # Remove strength traing as an activity Keeping only Walking and Cycling.
    ############################################################################
    
    my_activities <-                        # Keep only Cycling and Walking.
      c( "Triking",
         "Walking")
    
    Activities <-
      Activities %>% 
        filter( activity_type %in% my_activities )
      
    Activities
  }

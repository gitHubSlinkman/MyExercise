# read_garmin_csv_file.R

require(tidyverse)                          # I live in the file path.
require(stringr)                            # For string manipulation

################################################################################
# Define required functions.
################################################################################

source("D:/R-Projects/MyExercise/functions/fix_column_name.R")

read_garmin_csv_file <-
  function( file_path )
  { 
    Activities <-                          # Read file
      read_csv( file_path,
                na = "--" )
    
    Activities <-                          # Fix column names.
      rename_with( Activities,
                   fix_column_name ) %>% 
      rename( date_time = date )
    
    ############################################################################
    # The data variable are not always present in all the Garemin data files.
    # Therefore we must remove variables that does not exist in all if the data
    # files.
    ############################################################################
    
    Activities <-                          # Remove columns that not available
      Activities                          # in all Garmin data files.
     
    
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
    
    
    ############################################################################
    # Add variable that records the date that the file was downloaded to each
    # row in the tibble.
    ############################################################################
    
    downloaded <-
      str_sub( file_path, 
              start = -14L, 
              end = -1L )
    
    Activities <-
      Activities %>% 
        add_column( downloaded )
    
    ############################################################################
    # Select only needed columns.
    ############################################################################
    
    Activities <-                           # Select only columns that I
      Activities %>%                        # require.
      select( 
        activity_type: max_hr,
        min_temp,
        best_lap_time:downloaded )
    
    Activities %>%                          # Ensure records are 
      arrange( date_time )                  # chronological order.
      
  }

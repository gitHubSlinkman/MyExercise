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
      Activities %>%                       # in all Garmin data files.
      select( 
        activity_type,
        date_time,
        favorite,
        title,
        distance,
        calories,
        time,
        avg_hr,
        max_hr,
        moving_time,
        elapsed_time,
        total_ascent,
        total_descent,
        min_elevation,
        max_elevation,
        avg_stride_length,
        min_temp,
        max_temp,
        number_of_laps,
        best_lap_time )
       
    
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
    
    Activities <-
      Activities %>% 
      select( 
        activity_type: max_hr,
        min_temp,
        best_lap_time:downloaded )
    
    Activities
      
  }

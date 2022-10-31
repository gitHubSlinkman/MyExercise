# prepare_garmin_data.R

require( here )                        # Used to determine project location.
require( tidyverse )                   # I live in the tidyverse.
require( lubridate )                   # For date-time processing.
require( flextable )

source("D:/R-Projects/MyExercise/functions/find_all_garmin_csv_files.R")
source("D:/R-Projects/MyExercise/functions/read_garmin_csv_file.R")
source("D:/R-Projects/MyExercise/functions/find_last_pooled_date_time.R")

prepare_garmin_data <-
  function(){
    project_directory <-                  # Determine project location in 
      here()                              # operating system file system.
    
    data_directory <-                     # Build file path to data directory.
      file.path( project_directory,
                 "data")
    
    
    files <-                              # Build an array to hold full project
      find_all_garmin_csv_files(          # file paths.
        data_directory )
    
    files <-                             # Ensure files in ascending order by 
      sort( files )                      # by date.
    
    
    Pooled_Activities <-                  # Read first Garmin csv files and save 
      read_garmin_csv_file( files[1])     # into tibble.
    
    for( j in 2:length(files)){           # Loop through the remaining files.
      
      last_history_date_time <-           # Determine date of last chronological
        find_last_history_date_time(      # entry.
          History )
      
      Activities <-                       # Read csv file.
        read_garmin_csv_file( files[j])
      
      Activities <-                       # Remove duplicate rows.
        Activities %>% 
        filter( date_time > 
                last_history_date_time )
      
      Pooled_Activities <-                          # Bind Rows
        Pooled_Activities %>% 
        bind_rows( Activities )           
    }
    
  }
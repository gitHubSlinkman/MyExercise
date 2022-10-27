# prototype_merge_files.R

require( here )                             # To determine project home.
require( tidyverse )                        # I live in the tidyverse.
require( lubridate )                        # For date manipulation.
require( stringr )                          # For tidyverse string manipulation.
require( flexttable )                       # To display data.

################################################################################
# Define required functions.
################################################################################

source("D:/R-Projects/MyExercise/functions/find_all_garmin_csv_files.R")
source("D:/R-Projects/MyExercise/functions/read_garmin_csv_file.R")


data_directory <-                           # Find project data directiry.                    
  file.path( here(),
             "data" ) 

files <-                                    # Find the file paths to all
  find_all_garmin_csv_files(                    # data directory.
    data_directory ) 

files <- sort( files,                       # Sort files into decreasing
               decreasing = TRUE )          # chronological order.

Combined<-                                  # Read first file.
  read_garmin_csv_file( files[1])

next_file <- 2                              # Read next file.

NF <-                               # Read next file.
   read_garmin_csv_file( 
     files[next_file]) 

Combined %>% 
  add_row(NF)

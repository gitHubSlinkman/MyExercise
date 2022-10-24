# read_garmin_csv_file.R

require(tidyverse)                          # I live in the file path.


read_garmin_csv_file <-
  function( file_path )
  { 
    Activities <-                          # Read file
      read_csv( file_path )
    
    
    Activities
  }
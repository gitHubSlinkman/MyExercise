## test__convert_hhmm_to_dec_hours

library(tidyverse)                          # I live in the tidy verse.
require(lubridate)                          # For date manipulation

source("D:/R-Projects/MyExercise/functions/convert_hhmm_to_dec_hours.R")

date_time <- now()
hh <- hour( date_time )
mm <- minute( date_time )

hours <- 
  convert_hhmm_to_dec_hours( hh, mm )
hours

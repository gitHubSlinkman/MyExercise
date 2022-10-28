# find_last_history_date_time.R

require(tidyverse)                          # I live in the tidyverse

find_last_history_date_time <-
  function( History )
  { 
   max( History %>%                         # Pull the date_time from History
           pull( date_time))                # and find maximum date_time.
  }
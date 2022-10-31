# find_last_history_date_time.R

require(tidyverse)                          # I live in the tidyverse

find_last_pooled_date_time <-
  function( Pooled_Actvities  )
  { 
   max( Pooled_Activities %>%               # Pull the date_time from History
           pull( date_time ))               # and find maximum(last ) date_time.
  }
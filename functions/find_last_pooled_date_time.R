# find_latest_pooled_date_time.R

require( tidyverse )                        # I live in the tidyverse.
require( lubridate )                        # For date manipulation.

find_last_pooled_date_time <-
  function( Pooled_Activities ){
    date_times <-  
      Pooled_Activities %>% 
        pull( date_time )
    
    max( date_times )
  }
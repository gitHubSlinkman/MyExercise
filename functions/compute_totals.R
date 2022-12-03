# compute_totals.R

require( tidyverse )                        # I live in the tidyverse.
require( lubridate )                        # For date manipulation.

compute_totals <-
  function( Activities,
            groups = NULL ){
    
    Totals <- 
      Activities %>% 
        summarise(
         label           = "Totals",
         frequency       = n(),
         total_distance  = sum( distance ),
         total_time      = as.numeric( seconds( sum( time ))/3600),
         total_calories  = sum( calories ))
    
    Totals
    
  }
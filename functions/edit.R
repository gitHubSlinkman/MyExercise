edit_data.R

require( tidyverse )
require( lubridate  )

edit_data <-
  function( Pooled_Activities ){
    Pooled_activities %>% 
      mutate( 
        activity_type =
          ifelse( date_time == ymd("2022-12-02 10:29:16",
                                   "Raking",  activity_type )))
  }
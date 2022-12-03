# edit_data.R

require( tidyverse )
require( lubridate  )

edit_data <-
  function( Pooled_Activities ){
    Pooled_Activities %>% 
      mutate( 
        
        activity_type =
          ifelse( date_time == ymd_hms(
            "2022-11-02 11:44:38"),
            "Raking",  
            activity_type ),
        
        activity_type =
          ifelse( date_time == ymd_hms(
            "2022-11-12 13:42:57" ),
            "Raking",  
            activity_type ),
        
        
        
        activity_type =
          ifelse( date_time == ymd_hms(
            "2022-12-02 10:29:16"),
            "Raking",  
            activity_type ))
  }

edit_data( Pooled_Activities ) %>% 
  flextable()

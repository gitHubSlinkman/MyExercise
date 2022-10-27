# select_columns.R

require( tidyverse )                        # I live in the tidyverse.

select_columns <-
  function( this_tibble )
  {
    this_tibble %>% 
      select( activity_type,    
              date-time,             
              favorite,         
              title,            
              distance,         
              calories,         
              time,             
              avg_hr,           
              max_hr,           
              avg_run_cadence,  
              max_run_cadence,  
              avg_speed,        
              max_speed,       
              elev_gain,        
              elev_loss ,       
              avg_stride_length,
              min_temp,         
              decompression,    
              best_lap_time ,   
              number_of_laps,   
              max_temp,         
              moving_time,      
              elapsed_time,     
              min_elevation,    
              max_elevation )
  }
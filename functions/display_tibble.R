# display_tibble.R

display_tibble <-
  function( Activities )
  {
    Activities %>% 
      select( activity_type,
              date_time,
              title,
              distance,
              calories,
              avg_hr,
              max_hr,
              total_ascent ) %>% 
      flextable() %>% 
        width( 2 = 2, 2.25 )
  }
    
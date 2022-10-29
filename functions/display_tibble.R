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
              downloaded ) %>% 
      flextable() %>% 
        width( j = 2, 2.25 )  %>% 
        width( j = 6, 2.25 )
  } 
    
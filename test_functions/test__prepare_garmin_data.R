#  test__prepare_garmin_data.R

require(tidyverse)                          # I live in the tidyverse.
require(flextable)                          # To display date.

source("D:/R-Projects/MyExercise/functions/prepare_garmin_data.R")

prepare_garmin_data() %>% 
  select( 1:7 ) %>% 
  flextable() %>% 
    autofit()


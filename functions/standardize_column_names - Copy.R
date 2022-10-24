# standardize_names.R
#
################################################################################
# This function standardizes the variable names to complient with tidyverse
# variable nameing conventions,
################################################################################

require(tidyverse)                              # I live in the tidyverse.

standardize_column_names <-
    function(df)
        {
          df %>% 
            rename( "activity_type"     = "Activity Type",
                    "date_time"         = "Date",
                    "favorite"          = "Favorite",
                    "title"             = "Title",
                    "distance"          = "Distance",
                    "calories"          = "Calories",
                    "time"              = "Time",
                    "avg_hr"            = "Avg HR",   
                    "max_hr"            = "Max HR",
                    "avg_run_cadence"   = "Avg Run Cadence...10",
                    "max_run_cadence"   = "Max Run Cadence...11",
                    "avg_pace"          = "Avg Pace",
                    "max_pace"          = "Best Pace",
                    "total_ascent"      = "Total Ascent",
                    "total_descent"     = "Total Descent",
                    "avg_stride_length" = "Avg Stride Length",
                    "best_lap_time"     = "Best Lap Time",
                    "number_of_laps"    = "Number of Laps",
                    "max_temp"          = "Max Temp",
                    "moving_time"       = "Moving Time",
                    'elapsed_time'      = "Elapsed Time",
                    "min_elevation"     = "Min Elevation",
                    "max_elevation"     = "Max Elevation" )
        }
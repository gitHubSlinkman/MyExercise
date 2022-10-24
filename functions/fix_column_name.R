# fix_column_names.R

fix_column_name <-
  function( variable )
    {  str_replace( tolower(variable), " ","_" )}
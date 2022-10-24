# find_last_activity_files_v001.R


################################################################################
# This script finds the last file sorted by date in the data directory.  The
# name of the file is returned.
################################################################################

require(here)                                   # Required ro locate project
                                                # directory.

find_latest_activities_file <-
    function(){
        
        data_directory <-                        # Construct path t0 data
            file.path(here(), "data" )           # directory.
        
        files <-                                 # Get names of all files in
            list.files( path = data_directory,   # data directory.
                        full.names = TRUE ) 
        
        files <- sort( files )                   # Ensure the list is sorted.
        
        files[length( files )]                   # Return the last file by                                         # date.
        
    }
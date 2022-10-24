## convert_hhmm_to_dec_hours
#
################################################################################
# This function converts hours and minutes interval to a decimal hours interval.
################################################################################

convert_hhmm_to_dec_hours <-
    function( hh, mm )
    {
        round( hh + mm/60, 2)
    }
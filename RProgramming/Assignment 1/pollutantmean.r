##############################
## BOGDAN A. RAU            ##
## Week 1 Assignment Part I ##
## http://bogdanrau.com     ##
##############################

pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        df <- data.frame()                              # Initialize a data frame
        path <- paste(getwd(), directory, sep="/")      # Set path according to 'directory'
        for(i in 1:length(id)) {                        # Loop through file name 'ids'
                add <- read.csv(as.character(paste0(path, "/", sprintf("%03s", id[i]), ".csv")))
                df <- rbind(df, add)                    # Create an appended table
        }     
        colnames <- c("date", "sulfate", "nitrate")     # Assign column names
        assign("dat", df, envir=.GlobalEnv)             # Assign data table to a data frame
        
        ## Calculate mean and round to 3 decimal places
        round(mean(dat[[pollutant]], na.rm=TRUE), digits=3)
}
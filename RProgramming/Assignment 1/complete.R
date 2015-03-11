###############################
## BOGDAN A. RAU             ##
## Week 1 Assignment Part II ##
## http://bogdanrau.com      ##
###############################

complete <- function(directory, id = 1:332) {    # Initiate complete function
        
        nobs <- function(id) {                   # Function to calculate number of complete obs per file
                df <- data.frame()               # Initialize an empty data frame
                path <- paste(getwd(), directory, sep="/")    # Set path
                for(i in 1:length(id)) {         # For i in the selection (default 1:332), read in CSVs and create data frame
                        add <- read.csv(as.character(paste0(path, "/", sprintf("%03s", id[i]), ".csv")))
                        df <- rbind(df, add)
                }
                colnames <- c("date", "sulfate", "nitrate")   # Assign column names
                assign("dat", df)
                return (sum(complete.cases(dat)))             # Return sum of complete cases per file.
               
        }
        return (data.frame(id=id, nobs=sapply(id, nobs)))
}
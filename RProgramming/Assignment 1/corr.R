################################
## BOGDAN A. RAU              ##
## Week 1 Assignment Part III ##
## http://bogdanrau.com       ##
################################
source("complete.R")
corr <- function(directory, threshold=0) {
        
        completeCase <- complete("specdata")    # Run the complete function within the directory
        completeCase <- completeCase[completeCase$nobs > threshold, ]    # Subset where complete.cases > threshold

        corrsNum <- numeric(0)
        for (cid in completeCase$id) {          # For each ID in completeCase, create data & calculate correlations
                CaseData <- monitors(cid, directory)
                corrsNum <- c(corrsNum, cor(CaseData$sulfate, CaseData$nitrate, use = "pairwise.complete.obs"))
        }
        return(corrsNum)
        # Return a numeric vector of correlations
}

# Helper function to determine monitors that are above threshold
monitors <- function(id, directory) {                # Function that reads in IDs
        path <- paste(getwd(), directory, sep="/")   # Get directory path   
        files <- paste0(path, "/", sprintf("%03s", as.numeric(id)), ".csv")    # List files
        rawdata <- read.csv(files)                   # Read in the CSVs
        return(rawdata)                              # Return the dataset (will be used in the corr function)
}
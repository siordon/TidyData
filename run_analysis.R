# run_analysis.R: Getting and Cleaning Data Course Project
# This script contains three main functions:
#       dldataset() - to download the source data and unzip it to the
#                     current working directory if necessary.         
#       getcombineddata() - returns the combined dataset as specified by step 4
#                           of the project instructions. Ie, the means and std dev
#                           values, subject, and activity names from the merged test 
#                           and train datasets.
#       doprocessing() - creates data frames in the parent environment:
#                           HARdf is the data from getcombineddata() ("step 4" data)
#                           HARmeansdf is the summary dataset containing averages
#                           from HARdf for each subject and activity ("step 5 data")
#                        Also optionally writes HARmeansdf to file.
#
# Usage: 
# If you do not already have the data, run dldataset() and then doprocessing()
# If you do have the data, make sure it has been extracted to the current working 
# directory and then run doprocessing()  - see also the note on basedir below.

# Note: the dplyr package is required.
library(dplyr)

# basedir is the name of the folder produced by unzipping the downloaded dataset.
# If running this code in this extraction folder ("UCI HAR Dataset") then set basedir to ""
basedir <- "UCI HAR Dataset"


# The dldataset() function downloads and unzips the dataset into the current working directory
dldataset <- function() {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url,"UCI_HAR_Dataset.zip",mode="wb")
    unzip("UCI_HAR_Dataset.zip")
}


# The getcombineddata() function loads all required datasets, combines test and train
# data, and returns the tidy data with subject, activity name, and the mean() and std()
# values for each variable in the feature vector (total 68 columns)
getcombineddata <- function() {
    
    # The loaddf() function loads either the test or train dataset (given by dsname),
    # with the column names obtained from the feature namess dataset (featurenamesdf),
    # which must be loaded prior to calling this function. 
    loaddf <- function(dsname) {

        # Load the subject identifiers
        message(paste0("   ",dsname,": loading subject data"))
        filename <- file.path(basedir,dsname,paste0("subject_",dsname,".txt"))
        subjectdf <- read.table(filename,col.names = c("subject"))
        
        # Load the corresponding activity id values
        message(paste0("   ",dsname,": loading activity data"))
        filename <- file.path(basedir,dsname,paste0("y_",dsname,".txt"))
        activitydf <- read.table(filename,col.names="activityid")
        # Join activitydf and activitynamesdf to get the activity names. 
        # Note: the inner_join() function preserves the row order... merge messes it up.
        activitydf <- inner_join(activitydf,activitynamesdf,by="activityid")
        
        # Load the main data, consisting of the 561 column "feature" vector.
        # Note: col.names = featurenames 
        message(paste0("   ",dsname,": loading main data"))
        filename <- file.path(basedir,dsname,paste0("X_",dsname,".txt"))
        featuredf <- read.table(filename, col.names=featurenames, colClasses="numeric")
    
        # Combine columns and return the complete dataframe
        cbind(subjectdf,activitydf,featuredf)
    }


    message("Loading feature names dataset...")
    featurenamesdf <- read.table(file.path(basedir,"features.txt"))
    featurenames <- featurenamesdf[,2]

    message("Loading activity names dataset...")
    activitynamesdf <- read.table(file.path(basedir,"activity_labels.txt"),col.names=c("activityid","activityname"))

    message("Loading test dataset...")
    testdf <- loaddf("test")

    message("Loading training dataset...")
    traindf <- loaddf("train")
    
    message("Combining datasets...")
    completedf <- rbind_list(testdf,traindf)

    
    message("Cleaning up column names...")
    # We only want to keep the mean and standard deviation columns.
    # Note that these are the ones containing mean() and std(), however the 
    # brackets get cleaned automatically by R and replaced with a .
    # Use grepl to produce a list of which column names match.
    completedf <- select(completedf, matches("subject|activityname|mean\\.\\.|std\\.\\.",ignore.case=FALSE))
    
    # Finally, this will leave some column names like tBodyAcc.mean...X
    # We now clean up the column names to remove .. (so ... becomes .)
    names(completedf) <- gsub("..","",names(completedf),fixed=TRUE)
    
    # We also change mean.X, std.X etc into X.mean, X.std etc so that the
    # function (mean or std) is always at the end of the column name    
    names(completedf) <- sub("(mean|std)\\.(.)","\\2\\.\\1",names(completedf))
    
    # Return the complete df
    completedf
}


# The doprocessing() function produces the actual data frames.
# It may be supplied with an optional parameter, writetofile (default FALSE)
# specifying whether the summary data (means) should be written to a file.
doprocessing <- function(writetofile = FALSE) {
    # HARdf is the combined test and train data (mean and std dev values only)
    # along with subject ID and activity name ("step 4" data)
    HARdf <<- getcombineddata()
    
    # HARmeansdf is the summary dataset containing the average of each mean and std dev
    # value from HARdf, for each subject and activity ("step 5" data)
    HARmeansdf <<- 
        HARdf %>% 
        group_by(subject, activityname) %>%
        summarize_each(funs(mean))
    
    if (writetofile) {
        write.table(HARmeansdf,file="HAR_summary_means.txt",row.names=FALSE)
    }
}

#Getting and Cleaning Data Course project 
##run_analysis.R

This script can be used to download and clean the Human Activity Recognition (HAR) data.
Two dataframes are created. The first contains the mean() and std() values from each feature vector
along with the corresponding subject id and activity name. It contains all rows from both the test
and train datasets. 
The second dataframe is a summary of the first, containing the average values for all variables for
each subject id and activity name (Ie, the mean of the mean() and std() values).

The script contains three main functions:
* dldataset() - to download the source data and unzip it to the current working directory if necessary.         
* getcombineddata() - returns the combined dataset as specified by step 4
of the project instructions. Ie, the means and std dev
values, subject, and activity names from the merged test 
and train datasets.
* doprocessing() - creates data frames in the parent environment and optionally writes the summary dataset to file.
  + HARdf is the data from getcombineddata() ("step 4" data)
  + HARmeansdf is the summary dataset containing averages from HARdf for each subject and activity ("step 5 data")


###Usage: 
* If you do not already have the data, run dldataset() and then doprocessing()
* If you do have the data, make sure it has been extracted to the current working 
directory and then run doprocessing(). Run doprocessing(TRUE) to also save the summary 
dataset (produces HAR_summary_means.txt)

Note: The script assumes that you have extracted the zipfile "as is" and therefore the
current working directory contains the "UCI HAR Dataset" folder. If this is not the 
case you may need to change the basedir setting at the start of the script.

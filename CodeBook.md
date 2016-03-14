##Getting and Cleaning Data Course Project
###Human Activity Recognition Dataset: Code book

This file only describes what variables are present in the data produced by the run_analysis.R script.
It does not explain what these variables mean. 
_Note: for a full description of the source data, please refer to [this UCI page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)._ 

Both dataframes produced by run_analysis.R contain the same 68 variables. 
The summary dataset (HARmeansdf) contains the average mean() and std() values per subject and activityname (30 subjects, 6 activities, 
for a total of 180 rows). 
* subject - identifies the subject performing the activity (int, 1-30)
* activityname - identifies the activity name. One of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* The mean(), and std() values for each of the 33 feature variables in the list below (as described in features-info.txt in the source data).

A consistent convention has been used for the naming of the feature variable columns:  `Name[.Direction].Fn`  
Where `Name` is the variable name (eg tBodyAcc), `Direction` specifies the X, Y, or Z direction for those variables where applicable, 
and `Fn` is either "mean" or "std".   
Eg: `tBodyAcc.X.mean, tBodyAccMag.std`

For those variables where X, Y, and Z directions are specified, the mean value is provided for all three directions first, followed by the std deviation. 
Therefore, the first four columns after activityname are `tBodyAcc.X.mean, tBodyAcc.Y.mean, tBodyAcc.Z.mean` and `tBodyAcc.X.std`.

###Feature Variables

* tBodyAcc (X,Y,Z)
* tGravityAcc (X,Y,Z)
* tBodyAccJerk (X,Y,Z)
* tBodyGyro (X,Y,Z)
* tBodyGyroJerk (X,Y,Z)
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc (X,Y,Z)
* fBodyAccJerk (X,Y,Z)Z
* fBodyGyro (X,Y,Z)
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


###Complete Column List

* subject
* activityname
* tBodyAcc.X.mean
* tBodyAcc.Y.mean
* tBodyAcc.Z.mean
* tBodyAcc.X.std
* tBodyAcc.Y.std
* tBodyAcc.Z.std
* tGravityAcc.X.mean
* tGravityAcc.Y.mean
* tGravityAcc.Z.mean
* tGravityAcc.X.std
* tGravityAcc.Y.std
* tGravityAcc.Z.std
* tBodyAccJerk.X.mean
* tBodyAccJerk.Y.mean
* tBodyAccJerk.Z.mean
* tBodyAccJerk.X.std
* tBodyAccJerk.Y.std
* tBodyAccJerk.Z.std
* tBodyGyro.X.mean
* tBodyGyro.Y.mean
* tBodyGyro.Z.mean
* tBodyGyro.X.std
* tBodyGyro.Y.std
* tBodyGyro.Z.std
* tBodyGyroJerk.X.mean
* tBodyGyroJerk.Y.mean
* tBodyGyroJerk.Z.mean
* tBodyGyroJerk.X.std
* tBodyGyroJerk.Y.std
* tBodyGyroJerk.Z.std
* tBodyAccMag.mean
* tBodyAccMag.std
* tGravityAccMag.mean
* tGravityAccMag.std
* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std
* fBodyAcc.X.mean
* fBodyAcc.Y.mean
* fBodyAcc.Z.mean
* fBodyAcc.X.std
* fBodyAcc.Y.std
* fBodyAcc.Z.std
* fBodyAccJerk.X.mean
* fBodyAccJerk.Y.mean
* fBodyAccJerk.Z.mean
* fBodyAccJerk.X.std
* fBodyAccJerk.Y.std
* fBodyAccJerk.Z.std
* fBodyGyro.X.mean
* fBodyGyro.Y.mean
* fBodyGyro.Z.mean
* fBodyGyro.X.std
* fBodyGyro.Y.std
* fBodyGyro.Z.std
* fBodyAccMag.mean
* fBodyAccMag.std
* fBodyBodyAccJerkMag.mean
* fBodyBodyAccJerkMag.std
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.std
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.std


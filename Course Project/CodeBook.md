Code Book
=========

## Data Source
The source data set originates from the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. 

A full description is available here : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Transformations

To obtain the final data set, the following steps were performed

* Load Data
    * Load test data found here ./UCI HAR Dataset/test/
    * Load train data found here ./UCI HAR Dataset/test/
    * merge the two data sets into a single one
    
* Label Data
    * Load variables names from the file ./UCI HAR Dataset/features.txt
    * rename the data set columns
    
* Subset Data
    * Goal : extract only the measurements on the mean and standard deviation for each measurement
    * Get all the variables which label contains either `mean` or `std`
    * Subset in order to keep the columns obtained in the previous step

* Transform Data
    * Goal : use descriptive activity names to name the activities in the data set
    * Update the code of the activities by their labels
        *1 WALKING
        *2 WALKING_UPSTAIRS
        *3 WALKING_DOWNSTAIRS
        *4 SITTING
        *5 STANDING
        *6 LAYING
 
* Aggregate Data : average of each variable for each activity and each subject

## Variables

* _Subject_ : the subject who performed the activity.

* _Activity_ : the label of the activity performed.

* 79 variables, named as labeled in the original set, contain the average of each variable for each activity and each subject subject. 

* How to read variables, BodyAcc : Body linear Acceleration, Jerk : Jerk Signals, X/Y/Z : axis directions of the phone, Gyro : gyroscope

    * tBodyAcc-mean()-X
    * tBodyAcc-mean()-Y
    * tBodyAcc-mean()-Z
    * tBodyAcc-std()-X
    * tBodyAcc-std()-Y
    * tBodyAcc-std()-Z
    * tGravityAcc-mean()-X
    * tGravityAcc-mean()-Y
    * tGravityAcc-mean()-Z
    * tGravityAcc-std()-X
    * tGravityAcc-std()-Y
    * tGravityAcc-std()-Z
    * tBodyAccJerk-mean()-X
    * tBodyAccJerk-mean()-Y
    * tBodyAccJerk-mean()-Z
    * tBodyAccJerk-std()-X
    * tBodyAccJerk-std()-Y
    * tBodyAccJerk-std()-Z
    * tBodyGyro-mean()-X
    * tBodyGyro-mean()-Y
    * tBodyGyro-mean()-Z
    * tBodyGyro-std()-X
    * tBodyGyro-std()-Y
    * tBodyGyro-std()-Z
    * tBodyGyroJerk-mean()-X
    * tBodyGyroJerk-mean()-Y
    * tBodyGyroJerk-mean()-Z
    * tBodyGyroJerk-std()-X
    * tBodyGyroJerk-std()-Y
    * tBodyGyroJerk-std()-Z
    * tBodyAccMag-mean()
    * tBodyAccMag-std()
    * tGravityAccMag-mean()
    * tGravityAccMag-std()
    * tBodyAccJerkMag-mean()
    * tBodyAccJerkMag-std()
    * tBodyGyroMag-mean()
    * tBodyGyroMag-std()
    * tBodyGyroJerkMag-mean()
    * tBodyGyroJerkMag-std()
    * fBodyAcc-mean()-X
    * fBodyAcc-mean()-Y
    * fBodyAcc-mean()-Z
    * fBodyAcc-std()-X
    * fBodyAcc-std()-Y
    * fBodyAcc-std()-Z
    * fBodyAcc-meanFreq()-X
    * fBodyAcc-meanFreq()-Y
    * fBodyAcc-meanFreq()-Z
    * fBodyAccJerk-mean()-X
    * fBodyAccJerk-mean()-Y
    * fBodyAccJerk-mean()-Z
    * fBodyAccJerk-std()-X
    * fBodyAccJerk-std()-Y
    * fBodyAccJerk-std()-Z
    * fBodyAccJerk-meanFreq()-X
    * fBodyAccJerk-meanFreq()-Y
    * fBodyAccJerk-meanFreq()-Z
    * fBodyGyro-mean()-X
    * fBodyGyro-mean()-Y
    * fBodyGyro-mean()-Z
    * fBodyGyro-std()-X
    * fBodyGyro-std()-Y
    * fBodyGyro-std()-Z
    * fBodyGyro-meanFreq()-X
    * fBodyGyro-meanFreq()-Y
    * fBodyGyro-meanFreq()-Z
    * fBodyAccMag-mean()
    * fBodyAccMag-std()
    * fBodyAccMag-meanFreq()
    * fBodyBodyAccJerkMag-mean()
    * fBodyBodyAccJerkMag-std()
    * fBodyBodyAccJerkMag-meanFreq()
    * fBodyBodyGyroMag-mean()
    * fBodyBodyGyroMag-std()
    * fBodyBodyGyroMag-meanFreq()
    * fBodyBodyGyroJerkMag-mean()
    * fBodyBodyGyroJerkMag-std()
    * fBodyBodyGyroJerkMag-meanFreq()
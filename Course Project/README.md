Coursera - Johns Hopkins - Getting and Cleaning Data Course Project
==========================================================================

This repository contains the required items for the assignment described here after

The submitted items are :
1. **tidyData.txt** Tidy data set as described in the next section
2. A code book **CodeBook.md** that describes the variables, the data, and any transformations or work performed to clean up the data called . 
3. **README.md**

## Description of the assignment

One of the most exciting areas in all of data science right now is wearable computing - see for example this article ( http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/ ). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## How To

* Unzip the file getdata-projectfiles-UCI HAR Dataset.zip in the working directory.

* Place the scripts *run_analysis.R* in the working directory.

* Source the run_analysis via Rstudio or via R Console

* Tidy data are generated in the working directory, Cf. to the **CodeBook** to get the meaning of each column of the file
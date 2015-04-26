### Step 1 : Merges the training and the test sets to create one data set ###
# 1.1 Loading test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# 1.2 Combine test data
test_data <- cbind(subject_test,y_test,X_test)

# 1.3 Loading train data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# 1.4 Combine train data
train_data <- cbind(subject_train,y_train,X_train)

# 1.5 Group train and test data
measurements <- rbind(train_data,test_data)

# 1.6 Get the features
features <- read.table("./UCI HAR Dataset/features.txt")

# 1.7 Construct the measurements' column names
colNames <- c("subject","activity",as.character(features[,2]))

#1.8 Rename the columns names
names(measurements) <- colNames

### Step 2 : Extracts only the measurements on the mean and standard deviation for each measurement ###
#2.1 keep only the columns that contain mean and std in their names, keep subject and activity too
mean_std_columns_index <- sort(c(grep("mean",colNames),grep("std",colNames)))
column_index <- c(1,2,mean_std_columns_index)

#2.2 Subset - Keep only the columns that matter
sub_measurements <- measurements[,column_index]

### Step3 : Uses descriptive activity names to name the activities in the data set ###
sub_measurements$activity[sub_measurements$activity==1] <- "WALKING"
sub_measurements$activity[sub_measurements$activity==2] <- "WALKING_UPSTAIRS"
sub_measurements$activity[sub_measurements$activity==3] <- "WALKING_DOWNSTAIRS"
sub_measurements$activity[sub_measurements$activity==4] <- "SITTING"
sub_measurements$activity[sub_measurements$activity==5] <- "STANDING"
sub_measurements$activity[sub_measurements$activity==6] <- "LAYING"

### Step4 : Appropriately labels the data set with descriptive variable names ###
#Cf. Step 1.7 & Step 1.8 above

### Step 5 : Tidy data set with the average of each variable for each activity and each subject ###
tidyData <- aggregate(sub_measurements[,3:81],
                      list(Subject=sub_measurements$subject,
                           Activity=sub_measurements$activity
                          ),
                      mean
                     )

write.table(tidyData,file="tidyData.txt",row.name=FALSE)

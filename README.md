Course-Project
==============

Course project for the Getting &amp; Cleaning Data course

Getting & Cleaning Data:  Course Project
Author:  Dale Naho'olewa
Date:  18 Dec 2014

install.packages("dplyr")
library('dplyr')
library('reshape')

setwd("C:/Users/Dale/Google Drive/Coursera/DataSci/GetttingData/Week3/Project/UCI HAR Dataset")

--- This script will perform the following tasks:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average 
  of each variable for each activity and each subject.

Task #1. Merge the training and the test sets to create one data set.

     We will initially create two data-set: 
     1. a training dataset consisting of:
             measurements:  X_train.txt
             activity data: y_train.txt       (cbind() to measurements)
             subject data:  subject_train.txt (cbind() to measurements)

     2. a test dataset consisting of:
             measurements:  X_test.txt
             activity data: y_test.txt        (cbind() to measurements)
             subject data:  subject_test.txt  (cbind() to measurements)

Finally, we will rbind() test dataset to training dataset to accomplish this task.

--- Function Descriptions ---

Function:  bindSets
Arguments:
        set:  string    type of obseravations; expected values are { "train", "test" }
Return:
        X:    table     observation set with subject & activity variables appended.
Description:
        # Read observations into the 'X' table; the filename is derived from the 'set' argument
        # i.e.  when the value of 'set' is train, then the filename to read is 'train/X_train.txt'

        # Read the descriptive variable names from 'features.txt' into 'features' table.
        # The 'features' table is created in the parent scope.

        # Assign descriptive names to the variables in table 'X'.

        # Read activity codes into table 'y'; the filename is derived from the 'set' argument
        # i.e.  when the value of 'set' is train, then the filename to read is 'train/y_train.txt'

        # Rename the variable 'V1' to 'y'

        # Read subject IDs into table 's'; the filename is derived from the 'set' argument
        # i.e.  when the value of 'set' is train, then the filename to read is 'train/subject_train.txt'

        # Rename the variable 'V1' to 'subject'

        # Add the variable 'y' to table 'X'

        # Add the variable 'subject' to table 'X'

        # Return table 'X'.

joinSets <- function(set1="train", set2="test") {
        
        # Creating 'train' & 'test' datasets
        train <- bindSets(set1)
        test  <- bindSets(set2)
        
        # binding 'train' & 'test' datasets into a single dataset
        dataset <- rbind(train, test)
        dataset
}

# Task #2. Extract only the measurements on the mean and standard deviation for 
# each measurement.

selectVars <- function(colname) {
        # 'features' is defined at the parent scope.
        # 'keepVars' is a logical vector to identify variables to keep
        keepVars <- grepl(colname, features$V2, fixed=FALSE)
        keepVars
}

# Task #3. Use descriptive activity names to name the activities in the data set

nameActivity <- function(activity_codes) {
        # Read descriptive activity names in 'dataset'
        activity <- read.table("activity_labels.txt")
        
        # Create a vector of descriptive 'activity_names' based on 'activity_codes'
        activity_names <- lapply(activity_codes, 
                                 function(elt) as.character(activity$V2[elt]))
        # Return activity names
        activity_names
}

# Task #5. From the data set in step 4, create a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

meanVars <- function(myIds) {
        md <- melt(dataset, id=myIds)
        avg <- cast(md, subject~y~variable, mean)
}

#---------------------------------------------------------------------
# Task #1:  Join training & test data-sets into a single data-set.
# Task #4:  Assigning descriptive names to variables in dataset


# Task #2:  Drop all variables except thoses that include mean() or std() measurements.


# Task #3:  Use descriptive activity names to name the activities in the data set


# Task #5:  From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.


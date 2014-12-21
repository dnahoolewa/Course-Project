# Getting & Cleaning Data:  Course Project #
* Author:  Dale Naho'olewa
* Date:  18 Dec 2014

#### Installed Packages
* dplyr
* reshape

#### This script will perform the following tasks
* Task #1. Merge the training and the test sets to create one data set.
* Task #2. Extract only the measurements on the mean and standard deviation for each measurement. 
* Task #3. Use descriptive activity names to name the activities in the data set
* Task #4. Appropriately label the data set with descriptive variable names. 
* Task #5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Function Prologues

## Function:  bindSets
### Purpose
This function implements Task #1 and Task #4.
### Arguments
* set:  string    type of obseravations; expected values are { "train", "test" }
### Return
* X:    table     observation set with subject & activity variables appended.
### Description
We initially create two data-set: 
1. Create a *training* dataset consisting of:
   * measurements:  X_train.txt
   * activity data: y_train.txt       
   * subject data:  subject_train.txt
2. Create a *test* dataset consisting of:
   * measurements:  X_test.txt
   * activity data: y_test.txt        
   * subject data:  subject_test.txt
3. Combine the *test* dataset to the *training* dataset to complete this task.

## Function:  joinSets
### Purpose
This function implements Task #1.
### Arguments
* set1:      string       name of dataset, e.g. 'train'
* set2:      string       name of dataset, e.g. 'test'
### Return
* dataset:   table        a combined dataset
### Description
1. Call the 'bindSets function for 'train' & 'test' datasets, respectively.
2. Bind 'train' & 'test' datasets into a single dataset
3. Return combined dataset

## Function:  selectVars
### Purpose
This function implements Task #2.
### Arguments
* colname:   string	column (i.e. variable) name pattern to find.
### Return
* keepVars:  logi vect	variables to keep for final proessing.
### Description
1. The descriptive variable names can be found in the 'features' object.
2. Use the 'grep' function to find pattern in variable names.
3. Return keepVars vector.

## Function:  nameActivity
### Purpose
This function implements Task #3.
### Arguments
* activity_codes
### Description
1. Read descriptive activity names in 'activity' table       
2. Create a list of descriptive 'activity_names' based on variable 'y' in dataset

## Function:  meanVars
### Purpose
This function implements Task #5.
### Arguments
* myIds
### Return
* Table of mean variables
### Description
1. Use melt and cast functions to summarize dataset variables.

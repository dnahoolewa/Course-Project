#---------------------------------------------------------------------
# Task #1:  Join training & test data-sets into a single data-set.
# Task #4:  Assigning descriptive names to variables in dataset
dataset <- joinSets("train", "test")

# Task #2:  Drop all variables except thoses that include mean() or std() measurements.
dataset <- dataset[, selectVars("mean()") | selectVars("std()")]

# Task #3:  Use descriptive activity names to name the activities in the data set
dataset$activity <- nameActivity(dataset$y)

# Task #5:  From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
avg <- meanVars(c("subject","activity"))

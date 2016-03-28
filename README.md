## Getting and Cleaning Data Project

This is the repository for the course project for the Coursera Getting and Cleaning Data course.

The dataset being used is the following: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). A full description of the data can be found at this address.

### Project Summary
The following is a summary description of the project instructions

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive activity names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Files
The code needs to be modified at line 3 to set the working directory, where the zip file has already been un-compressed as the folder "UCI HAR Dataset".

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the analyses according to instructions. 

`TidyData.txt` is the output file from the code.

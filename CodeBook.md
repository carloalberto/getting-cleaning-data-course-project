## Code Book

The following sections summarise the resulting data fields in the `TidyData.txt` output file, a dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows).

### Identifiers

* `subject` - The ID of the test subject
* `activity` - Values for the type of activity performed when the corresponding measurements were taken

### Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test

### Attribute Information / Measurements

For each record in the dataset the following set of information is provided: 
- An identifier of the subject who carried out the experiment.
- Its activity label. 
- Mean and Std Deviation for Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Mean and Std Deviation Triaxial Angular velocity from the gyroscope. 

### Transformations performed to original data (what does the code do, according to instructions?)

* Prepare workspace, read data into tables, assign `colnames` and merge the training and the test sets to create one data set, by means of "cbinding".

* Extract only the measurements on the mean and standard deviation for each measurement by means of grep function, after extracting these columns, they are given the correct names, taken from `features.txt`.

* Use descriptive activity names to name the activities in the data set. Merge data subset with the activityType table to include the descriptive activity names

* Appropriately label the data set with descriptive activity names. Use `gsub` function for pattern replacement to clean up the data labels.

* Create a second, independent tidy data set with the average of each variable for each activity and each subject. This task is accomplished by means of the `aggregate` function from the `plyr` package.
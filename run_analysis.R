# Prepare workspace
library(plyr);
setwd("~/ALBERT/CLASSES/Coursera_GetClean-Data/Assignments/courseproject/")
UCIdir <- "UCI\ HAR\ Dataset"

# Load Raw Data
# Read activity files
dataActivityTest  <- read.table(file.path(UCIdir, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(UCIdir, "train", "Y_train.txt"),header = FALSE)

# Read Subject Files
dataSubjectTrain <- read.table(file.path(UCIdir, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(UCIdir, "test" , "subject_test.txt"),header = FALSE)

# Read Features Files
dataFeaturesTest  <- read.table(file.path(UCIdir, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(UCIdir, "train", "X_train.txt"),header = FALSE)

# Pre-merge by concatenating Train and Test rows
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

# Set Names to Variables
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(UCIdir, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

# Merge Training and Test dataset into one data set
dataAll <- cbind(dataSubject, dataActivity)
finalData <- cbind(dataFeatures, dataAll)

# Extract the measurements on the mean and standard deviation
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
finalData<-subset(finalData,select=selectedNames)

# Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path(UCIdir, "activity_labels.txt"),header = FALSE)

# Appropriately labels the data set with descriptive variable names

names(finalData)<-gsub("^t", "time", names(finalData))
names(finalData)<-gsub("^f", "frequency", names(finalData))
names(finalData)<-gsub("Acc", "Accelerometer", names(finalData))
names(finalData)<-gsub("Gyro", "Gyroscope", names(finalData))
names(finalData)<-gsub("Mag", "Magnitude", names(finalData))
names(finalData)<-gsub("BodyBody", "Body", names(finalData))

# Creates a second, independent tidy data set and ouput it

finalData2 <- aggregate(. ~subject + activity, finalData, mean)
finalData2 <- finalData2[order(finalData2$subject,finalData2$activity),]
write.table(finalData2, file = "TidyData.txt",row.name=FALSE)
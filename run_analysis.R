# Load and store original test and train data
testData <- read.table("UCI HAR Dataset//test//X_test.txt")
trainData <- read.table('UCI HAR Dataset//train//X_train.txt')

# Load and store original names of the features
featuresDescription <- read.table("UCI HAR Dataset//features.txt")

# Merge original test and train data
fullData <- rbind(testData, trainData)

# Set the features as the column names for the merged data
colnames(fullData) <- featuresDescription[,2]

# Load and store the test activity data
testActivityLabels <- read.table("UCI HAR Dataset//test//y_test.txt")
testActivityLabels$Id <- 1:nrow(testActivityLabels)

# Set the column name of the test activity data
colnames(testActivityLabels) <- c("ActivityId", "RowId")

# Load and store the train activity data
trainActivityLabels <- read.table("UCI HAR Dataset//train//y_train.txt")
trainActivityLabels$Id <- 1:nrow(trainActivityLabels)

# Set the column name of the train activity data
colnames(trainActivityLabels) <- c("ActivityId", "RowId")

# Store and load the activity description/names
activityDescription <- read.table("UCI HAR Dataset//activity_labels.txt")
colnames(activityDescription) <- c("ActivityId", "Activity")

# Merge and reduce the test activity data with its description/names into another table
testActivityDescription <- merge(testActivityLabels, activityDescription, by="ActivityId")
testActivityDescription <- testActivityDescription[order(testActivityDescription$RowId),]
testActivityDescription <- data.frame(testActivityDescription$Activity)
colnames(testActivityDescription) <- c("Activity")

# Merge and reduce the train activity data with its description/names into another table
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
trainActivityDescription <- merge(trainActivityLabels, activityDescription, by="ActivityId")
trainActivityDescription <- trainActivityDescription[order(trainActivityDescription$RowId),]
trainActivityDescription <- data.frame(trainActivityDescription$Activity)
colnames(trainActivityDescription) <- c("Activity")

# Merge test and train activity data after getting descriptions/name
fullActivityDescription <- rbind(testActivityDescription, trainActivityDescription)

# Load and store test and train subjects' data
testDataSubjects <- read.table("UCI HAR Dataset//test//subject_test.txt")
trainDataSubjects <- read.table("UCI HAR Dataset//train//subject_train.txt")

# Merge test and train subject data into single table
fullDataSubjects <- rbind(testDataSubjects, trainDataSubjects)
colnames(fullDataSubjects) <- c("SubjectId")

# Merge subject, activity and original data into a single table for cleaning and tidying
fullDataMerged <- cbind(fullDataSubjects, fullActivityDescription, fullData)

# Load ReShape2 library
#install.packages("reshape2")
library("reshape2")

# Process data to get independent data set with the average of each variable for each activity and each subject
fullDataMergedClean <- melt(fullDataMerged, id=c("SubjectId", "Activity"))
fullDataMergedTidy <- dcast(fullDataMergedClean, SubjectId+Activity~variable, mean)

# Reduce new data set to have only Mean and Standard Deviation data
tidyDataSet <- fullDataMergedTidy[,grep("SubjectId|Activity|mean\\(\\)|std\\(\\)", colnames(fullDataMergedTidy))] 

# Rename column names
names(tidyDataSet) <- gsub("-mean\\(\\)-X", "MeanXAxis", names(tidyDataSet))
names(tidyDataSet) <- gsub("-mean\\(\\)-Y", "MeanYAxis", names(tidyDataSet))
names(tidyDataSet) <- gsub("-mean\\(\\)-Z", "MeanZAxis", names(tidyDataSet))
names(tidyDataSet) <- gsub("-std\\(\\)-Z", "STD_ZAxis", names(tidyDataSet))
names(tidyDataSet) <- gsub("-std\\(\\)-Y", "STD_YAxis", names(tidyDataSet))
names(tidyDataSet) <- gsub("-std\\(\\)-X", "STD_XAxis", names(tidyDataSet))
names(tidyDataSet) <- gsub("-mean\\(\\)", "_Mean", names(tidyDataSet))
names(tidyDataSet) <- gsub("-std\\(\\)", "_STD", names(tidyDataSet))
names(tidyDataSet) <- gsub("MeanXAxis", "Mean_XAxis", names(tidyDataSet))
names(tidyDataSet) <- gsub("MeanYAxis", "Mean_YAxis", names(tidyDataSet))
names(tidyDataSet) <- gsub("MeanZAxis", "Mean_ZAxis", names(tidyDataSet))
names(tidyDataSet) <- gsub("tBodyAcc", "Time_BodyAcceleration_", names(tidyDataSet))
names(tidyDataSet) <- gsub("tBodyGyro", "Time_BodyGyroscope_", names(tidyDataSet))
names(tidyDataSet) <- gsub("tGravityAcc", "Time_GravityAcceleration_", names(tidyDataSet))
names(tidyDataSet) <- gsub("tBodyGyro", "Time_BodyGyroscope_", names(tidyDataSet))
names(tidyDataSet) <- gsub("fBodyAcc", "Freq_BodyAcceleration_", names(tidyDataSet))
names(tidyDataSet) <- gsub("fBodyGyro", "Freq_BodyGyroscope_", names(tidyDataSet))
names(tidyDataSet) <- gsub("fBodyBodyAcc", "Freq_BodyBodyAcceleration_", names(tidyDataSet))
names(tidyDataSet) <- gsub("fBodyBodyGyro", "Freq_BodyBodyGyroscope_", names(tidyDataSet))
names(tidyDataSet) <- gsub("fGravityAcc", "Freq_GravityAcceleration_", names(tidyDataSet))
names(tidyDataSet) <- gsub("Mag", "Magnitude", names(tidyDataSet))

# Write final data set to working directory
write.table(tidyDataSet, file="TidyDataSet.txt")

# Remove all working data from R environment
#install.packages("gdata")
library("gdata")
keep(tidyDataSet, sure=TRUE)

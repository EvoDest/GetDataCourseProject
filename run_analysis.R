# Load and store original test and train data
testdata <- read.table("UCI HAR Dataset//test//X_test.txt")
traindata <- read.table('UCI HAR Dataset//train//X_train.txt')

# Load and store original names of the features
featuresdescription <- read.table("UCI HAR Dataset//features.txt")

# Merge original test and train data
fulldata <- rbind(testdata, traindata)

# Set the column names of the merged data as the feature names
colnames(fulldata) <- featuresdescription[,2]

# Load and store the test activity data
testactivitylabels <- read.table("UCI HAR Dataset//test//y_test.txt")
testactivitylabelswithid <- testactivtylabels
testactivitylabelswithid$Id <- 1:nrow(testactivtylabels)

# Set the column name of the test activity data
colnames(testactivitylabelswithid) <- c("ActivityId", "RowId")

# Load and store the train activity data
trainactivitylabels <- read.table("UCI HAR Dataset//train//y_train.txt")
trainactivitylabelswithid <- trainactivitylabels
trainactivitylabelswithid$Id <- 1:nrow(trainactivitylabels)

# Set the column name of the train activity data
colnames(trainactivitylabelswithid) <- c("ActivityId", "RowId")

# Store and load the activity description/names
activitydescription <- read.table("activity_labels.txt")
colnames(activitydescription) <- c("ActivityId", "Activity")

# Merge and reduce the test activity data with its description/names into another table
testactivitydescription <- merge(testactivitylabelswithid, activitydescription, by="ActivityId")
testactivitydescription <- testactivitydescription[order(testactivitydescription$RowId),]
testactivitydescription <- data.frame(testactivitydescription$Activity)
colnames(testactivitydescription) <- c("Activity")

# Merge and reduce the train activity data with its description/names into another table
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
trainactivitydescription <- merge(trainactivitylabelswithid, activitydescription, by="ActivityId")
trainactivitydescription <- trainactivitydescription[order(trainactivitydescription$RowId),]
trainactivitydescription <- data.frame(trainactivitydescription$Activity)
colnames(trainactivitydescription) <- c("Activity")

# Merge test and train activity data after getting descriptions/name
fullactivitydescription <- rbind(testactivitydescription, trainactivitydescription)

# Load and store test and train subjects' data
testdatasubjects <- read.table("UCI HAR Dataset//test//subject_test.txt")
traindatasubjects <- read.table("UCI HAR Dataset//train//subject_train.txt")

# Merge test and train subject data into single table
fulldatasubjects <- rbind(testdatasubjects, traindatasubjects)

# Merge subject, activity and original data into a single table for cleaning and tidying
fulldatamerged <- cbind(fulldatasubjects, fullactivitydescription, fulldata)

# Load ReShape2 library
install.packages("reshape2")
library("reshape2")

# Precess data to get independent data set with the average of each variable for each activity and each subject
fulldatamergedclean <- melt(fulldatamerged, id=c("SubjectId", "Activity"))
fulldatamergedtidy <- dcast(fulldatamergedclean, SubjectId+Activity~variable, mean)

# Reduce new data set to have only Mean and Standard Deviation data
finaldataset <- fulldatamergedtidy[,grep("SubjectId|Activity|mean\\(\\)|std\\(\\)", colnames(fulldatamergedtidy))] 

# Rename column names
names(finaldataset) <- gsub("-mean\\(\\)-X", "MeanXAxis", names(finaldataset))
names(finaldataset) <- gsub("-mean\\(\\)-Y", "MeanYAxis", names(finaldataset))
names(finaldataset) <- gsub("-mean\\(\\)-Z", "MeanZAxis", names(finaldataset))
names(finaldataset) <- gsub("-std\\(\\)-Z", "STD_ZAxis", names(finaldataset))
names(finaldataset) <- gsub("-std\\(\\)-Y", "STD_YAxis", names(finaldataset))
names(finaldataset) <- gsub("-std\\(\\)-X", "STD_XAxis", names(finaldataset))
names(finaldataset) <- gsub("-mean\\(\\)", "_Mean", names(finaldataset))
names(finaldataset) <- gsub("-std\\(\\)", "_STD", names(finaldataset))
names(finaldataset) <- gsub("MeanXAxis", "Mean_XAxis", names(finaldataset))
names(finaldataset) <- gsub("MeanYAxis", "Mean_YAxis", names(finaldataset))
names(finaldataset) <- gsub("MeanZAxis", "Mean_ZAxis", names(finaldataset))
names(finaldataset) <- gsub("tBodyAcc", "Time_BodyAcceleration_", names(finaldataset))
names(finaldataset) <- gsub("tBodyGyro", "Time_BodyGyroscope_", names(finaldataset))
names(finaldataset) <- gsub("tGravityAcc", "Time_GravityAcceleration_", names(finaldataset))
names(finaldataset) <- gsub("tBodyGyro", "Time_BodyGyroscope_", names(finaldataset))
names(finaldataset) <- gsub("fBodyAcc", "Freq_BodyAcceleration_", names(finaldataset))
names(finaldataset) <- gsub("fBodyGyro", "Freq_BodyGyroscope_", names(finaldataset))
names(finaldataset) <- gsub("fBodyBodyAcc", "Freq_BodyBodyAcceleration_", names(finaldataset))
names(finaldataset) <- gsub("fBodyBodyGyro", "Freq_BodyBodyGyroscope_", names(finaldataset))
names(finaldataset) <- gsub("fGravityAcc", "Freq_GravityAcceleration_", names(finaldataset))
names(finaldataset) <- gsub("Mag", "Magnitude", names(finaldataset))

# Write final data set to working directory
write.table(finaldataset, file="TidyDataSet.txt")

# Remove all working data from R environment
install.packages("gdata")
library("gdata")
keep(finaldataset, sure=TRUE)

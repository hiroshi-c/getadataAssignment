library("data.table")
library("reshape2")
library("plyr")

### Step 0 - Preparation: Read all the required files into each table.

# Read train data set
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
YTrain <- read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE)
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)

# Read test data set
XTest <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
YTest <- read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE)
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)

# Read features
Features <- read.table("UCI HAR Dataset/features.txt", header=FALSE)

# Read the list of activity index and name pairs
ActivityList <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)


### Step 1 - Merges the training and the test sets to create one data set.

# Merge train data and test data (rbind), and then merge subject, Y (activity), and X (all measurements)
MergedData <- cbind(
    rbind(SubjectTrain, SubjectTest),
    rbind(YTrain, YTest),
    rbind(XTrain, XTest))


### Step 4 - Appropriately labels the data set with descriptive variable names.
### This is earlier than the direction, but I do it now for the convenience of Step 2.

# Use feature names (at the 2nd column in features.txt) for the columns of measurements.
# "subject" and "activity" for the rest.
MeasurementColumnNames <- as.vector(Features[,2])
colnames(MergedData) <- c("subject", "activity", MeasurementColumnNames)


### Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

# Use grep to find the columns whose name has "-std()" or "-mean()". Also including "subject" (1st) and "activity" (2nd).
ExtractColumnIndexes <- c(1, 2, grep("-mean\\(\\)-|-std\\(\\)", MeasurementColumnNames) + 2)
ExtractedData <- MergedData[ExtractColumnIndexes]


### Step 3 - Uses descriptive activity names to name the activities in the data set
# Replace activity column's value(index) with the activity name based on ActivityList.
ExtractedData$activity <- ActivityList[ExtractedData$activity, 2]


### Step 5 - From the data set in step 4, creates a second, independent tidy data set
### with the average of each variable for each activity and each subject.

# First, melting the data by measurments (feature names)
ExtractedFeatureNames <- colnames(ExtractedData)[3: ncol(ExtractedData)]
MeltedData <- melt(ExtractedData, id=c("subject", "activity"), measure.vars=ExtractedFeatureNames)

# Next, calculate the mean of each combination of (subject, activity, measured feature)
SummarizedData <- ddply(MeltedData, .(subject, activity, variable), summarize, mean = mean(value))

# Finally, write down to txt file.
write.table(SummarizedData, file="TidyDataSet.txt", row.names=FALSE, col.names=TRUE, sep=",")

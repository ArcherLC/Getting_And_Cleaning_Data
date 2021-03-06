## Set working directory
setwd("~/Documents/Coursera Data Specialization/")

## Read the training data
traindata <- read.csv("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
traindata[,562] <- read.csv("UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
traindata[,563] <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)

## Read test data
testdata<- read.csv("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
testdata[,562] <- read.csv("UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
testdata[,563] <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)

## Read the activiy labels data
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)

## Read the features data
features <- read.csv("UCI HAR Dataset/features.txt", sep = "", header = FALSE)

## Make the feature names better suited
features[,2] <- gsub('-mean', "Mean", features[,2])
features[,2] <- gsub('-std', 'Std', features[,2])
features[,2] <- gsub('[-()]', '', features[,2])

## 1. Merges the trainig and the test data sets to create one data set
mergedData = rbind(traindata, testdata)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
desiredColumns <- grep(".*Mean.*|.*Std.*", features[,2])
# Reduce features table to requirements
reducedfeatures <- features[desiredColumns,]
# Add two more columns for activity and subject
desiredColumns <- c(desiredColumns, 562, 563)
# Remove unwanted columns
mergedData <- mergedData[,desiredColumns]

# Add the features column names to new edited mergedData
## 4. Appropiately labels the data set with descriptive variable names
colnames(mergedData) <- c(reducedfeatures$V2, "Activity", "Subject")

## 3. Uses descriptive activity names to name the activities in the data set
indexactivity = 1
for(activitylabel in activityLabels$V2) {
    mergedData$Activity <- gsub(indexactivity,activitylabel,mergedData$Activity)
    indexactivity = indexactivity + 1
}

mergedData$Activity <- as.factor(mergedData$Activity)
mergedData$Subject <- as.factor(mergedData$Subject)

## 5. From the data set in step 4, creates a second, independent tidy data
## set with the the average of each variable for each activity and each
## subject.

tidydata <- aggregate(mergedData, by = list(activity = mergedData$Activity, subject = mergedData$Subject), FUN = "mean")
tidydata[,90] = NULL
tidydata[,89] = NULL
write.table(tidydata, "tidydata.txt", sep = "\t", row.name = FALSE)

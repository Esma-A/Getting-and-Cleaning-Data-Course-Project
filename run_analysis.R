# Esma-A
# Peer-graded Assignment: Getting and Cleaning Data Course Project.

## Load packages
library(data.table)
library(dplyr)

## Download Data
file.name <- "tidy_dataset.zip"

if(!file.exists(file.name)){
  DataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(DataUrl, file.name, method = "curl")
}

if(!file.exists("UCI HAR Dataset")){
  unzip(file.name)
}

## Load Dataset:

### Features

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("N","Features"))

### Activity labels

activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Labels", "Activity"))

### Subject test

subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X.test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
Y.test <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "Labels")

### Subject train
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X.train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features[,2])
Y.train <- read.table("UCI HAR Dataset/train/Y_train.txt", col.names = "Labels")


# 1. Merge the training and the test sets to create one data set.
Subject <- rbind(subject.train, subject.test)
X <- rbind(X.train, X.test)
Y <- rbind(Y.train, Y.test)
Merge <- cbind(Subject, X, Y)

# 2.Extract only the measurements on the mean and standard deviation for each measurement.

MeanStd <- Merge %>% select(subject, Labels, contains("mean"), contains("std"))

# 3. Using descriptive activity names to name the activities in the data set.

MeanStd$Labels <- activity.labels[MeanStd$Labels, 2]

# 4. Appropriately labels the data set with descriptive variable names.

## ^t for Time
## ^f for Frequency
## Acc for Accelerometer
## Gyro for Gyroscope
## Mag for Magnitude
## BodyBody for Body

names(MeanStd)
names(MeanStd)[2] = "Activity"
names(MeanStd) <- gsub(pattern = "^t", replacement = "Time", names(MeanStd))
names(MeanStd) <- gsub(pattern = "^f", replacement = "Frequency", names(MeanStd))
names(MeanStd) <- gsub(pattern = "Acc", replacement = "Accelerometer", names(MeanStd))
names(MeanStd) <- gsub(pattern = "Gyro", replacement = "Gyroscope", names(MeanStd))
names(MeanStd) <- gsub(pattern = "Mag", replacement = "Magnitude", names(MeanStd))
names(MeanStd) <- gsub(pattern = "BodyBody", replacement = "Body", names(MeanStd))


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

TidyDataset <- MeanStd %>% group_by(subject, Activity) %>% summarise_all(funs(mean))
write.table(x = TidyDataset, file = "TidyDataset.txt", row.names = F)
TidyDataset


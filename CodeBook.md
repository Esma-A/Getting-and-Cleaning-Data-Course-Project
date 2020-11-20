Esma-A

This is the Code BOOK for the Tidy dataset

# Variables Assigned to the data

features - UCI HAR Dataset/features.txt file , 561 observations with 2 variables
activity.labels - UCI HAR Dataset/activity_labels.txt file, 6 observations with 2 variables
subject.test - UCI HAR Dataset/test/subject_test.txt file, 2947 observations with 1 variable
X.test - UCI HAR Dataset/test/X_test.txt, 2947 observations with 561 variables
Y.test - UCI HAR Dataset/test/Y_test.txt,  2947 observations with 1 variable
subject.train - UCI HAR Dataset/train/subject_train.txt, 7352 observations with 2 variables
X.train - UCI HAR Dataset/train/X_train.txt, 7352 observations with 561 variables
Y.train - UCI HAR Dataset/train/Y_train.txt, 7352 observations with 1 variable

The course required that I:

Merge the training and the test sets to create one data set.
I merged subject.train and subject.test using *rbind()* function and assigned it to variable _Subject_ as well as X.train, X.test assigned it variable _X_ and Y.train and Y.test assigned it variable _Y_ using *rbind()* function.

Assigned variable *Merge* to merge _Subject_, _X_ and _Y_ using *cbind()* function.

All other requirements are in the R Script run_analysis.R.

The R Script run_analysis.R has all the procedures followed that was required in the Getting and Cleaning Data Course Project.
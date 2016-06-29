# Getting_And_Cleaning_Data
Coursera's Getting and Cleaning Data Course Project

#Introduction
In this repository I have my work for Courser'a Getting and Cleaning Data project.  This project consisted of the analysis of data sets for human activity recognition using smartphones.

#The raw data
The data consists of 561 unlabeled observations.  The observations file for the test data is X_test.txt.  The activity labels for the test data is y_test.txt. The subject for each observation from the test data is subject_test.txt.

The training data set has the same structure.

Activity and features are provided in different files respectively (activity_labels.txt and features.txt).

#The tidy data script
For the project I worked on a script called run_Analysis.R.  In this script I merge the training and test data, extract the mean and standard deviation for each measurement, name the activities in the merged data set, and label the data set with descriptive variable names.  After all of this is done, a tidy data set is created with the average of each variable for each activity and each subject.

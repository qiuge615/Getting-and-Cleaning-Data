# Getting and Cleaning Data

## Course Project

Requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1. Download the data source and extract ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in the folder of ```UCI HAR Dataset```, use ```setwd()``` to setup working path.
3. Run ```source("run_analysis.R")```, then it will generate a new file ```tidy_data.txt``` in the working directory.

## Dependencies

It depends on ```data.table```. 

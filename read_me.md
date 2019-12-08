# Getting and Cleaning Data: Week 4 Project for Coursera JHU Getting and Cleaning Data Class

#### This repository is a cdwimer submission for Getting and Cleaning Data course project. It contains instructions detailing how to run analysis on the Human Activity Recognition Using Smartphones dataset.

## Dataset
[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) obtained from the following website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files
**code_book.md** a code book that describes the variables, the data, and any transformations or work performed to clean up the data

**run_analysis.R** performs the data preparation and then followed by the 5 steps defined in the course project’s instructions:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set.
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**final_data.txt** contains the exported final data 

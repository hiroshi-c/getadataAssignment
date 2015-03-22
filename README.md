# Getting and Cleaning Data Course Project
This repository includes the assignment work of the project.
This includes three pieces of information.
* run_analysis.R: script to process the raw data into tidy data set. Details are explained below.
* TidyDataSet.txt: Generated tidy data set.
* CodeBook.md: code book for TidyDataSet.txt

## Explaining run_analysis.R
Here is the outline of the process of this script.
Each step is also described in the script file as comment.

* Loading additional libraries
  * This script uses three additional libraries. data.table, reshape2, and plyr.
* Preparation: Read all the required files into each table.
  * This script assumes that all raw data files under "UCI HAR Dataset" sub directory of the workin directory.
  * This reads the data from 8 different txt files and stores into data table per each file.
* Step 1 - Merges the training and the test sets to create one data set.
  * Merge train data and test data (rbind), and then merge subject, Y (activity), and X (all measurements)
* Step 4 - Appropriately labels the data set with descriptive variable names. This is earlier than the direction, but I do it now for the convenience of Step 2.
  * Use feature names (at the 2nd column in features.txt) for the columns of measurements.
  * "subject" and "activity" for the rest.
* Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
  * Use grep to find the columns whose name has "-std()" or "-mean()". Also including "subject" (1st) and "activity" (2nd).
* Step 3 - Uses descriptive activity names to name the activities in the data set
  * Replace activity column's value(index) with the activity name based on ActivityList.
* Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * First, melting the data by measurments (feature names)
  * Next, calculate the mean of each combination of (subject, activity, measured feature)
  * Finally, write down to txt file.

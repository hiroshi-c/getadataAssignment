# CodeBook of TidyDataSet.txt

## Variables
* subject
  * ID of each person who did the activiy sets of this expmeirment. 
  * Unit: none, Integer
* activity
  * Name of the activity conducted.
  * Unit: none, String
* variable
  * Name of the measured features.
  * Unit: none, String
* mean
  * Mean value of measured feature for each subject and each activity. Each subject did each activity multiple times and this value is the mean of each measured feature.
  * Unit: normalized value within [-1, 1]

## Data
The original data is the result of experiment "Human Activity Recognition Using Smartphones Data Set", the detail of which is described here.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The raw data provided is here.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Transformation
This tidy data set was processed from the raw data with the following sets of transformations.
- Raw data set consists of separated files for subject ID, activity, and measurement data. Those are merged into one.
- Raw data set is the pair of 'test' set and 'train' set. Those are merged into one.
- The measurements on the mean and standard deviation are extracted.
- Calculate the mean of each measurement per each combination of activity and subject.


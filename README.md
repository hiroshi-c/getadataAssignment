# Getting and Cleaning Data Course Project
This repository includes the assignment work of the project.
This includes three pieces of information.
+run_analysis.R: script to process the raw data into tidy data set. Details are explained below.
+TidyDataSet.txt: Generated tidy data set.
+CodeBook.md: code book for TidyDataSet.txt

## Explaining run_analysis.R
Below outlines the process of this script.
Each step is also described in the script file.

+ Loading additional libraries
This script uses three additional libraries: data.table, reshape2, and ply.

+ Preparation: Read all the required files into each table.
This script assumes that all raw data files under "UCI HAR Dataset" sub directory of the workin directory.
This reads the data from 8 different txt files and stores into data table per each file.

+ Step 1: Merges the training and the test sets to create one data set.

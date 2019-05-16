# Read Me

## Data Set Used
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Downloading the data

1: The data is downloaded uusing 
download.file(zipurl,destFile)
2: Data is unziped using 
unzip(zipfile=destFile,exdir="./project")

Steps Followed

Load library dplyr 
Get zipped data
Unzip data
Get all files
Creating test data using xtest,ytest & subject test  
Creating train data using xtrain, ytrain & subject train
Create the features data
Providing proper variable names to test / train data set
Remove duplicate variables
Providing proper variable names to activity data set
Creating full test data and train data set by merging subject and activity
Create the main data table merging both table tables - this is the outcome of 1
Getting subset of data for mean and std
adding activity labels
Create new tidy data set 
write tidy data set

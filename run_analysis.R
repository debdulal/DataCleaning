# Load library  
library(dplyr)
  
  # Getting zipped data
  zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  if(!file.exists("./project")){
   dir.create("./project")
  }
  destFile <- "./project/projectData.zip"
  download.file(zipurl,destFile)
  unzip(zipfile=destFile,exdir="./project")
  list.files("./project")
  
  #define the unzipped file path
  sourcePath = file.path("./project", "UCI HAR Dataset")
  #getlist of all files
  allFiles = list.files(sourcePath, recursive=TRUE)
  #show the files
  allFiles
  
  
  #Creating test data using xtest,ytest & subject test
  testDataX = read.table(file.path(sourcePath, "test", "X_test.txt"),header = FALSE)
  testDataY = read.table(file.path(sourcePath, "test", "y_test.txt"),header = FALSE)
  subjectTestData = read.table(file.path(sourcePath, "test", "subject_test.txt"),header = FALSE)

  
  ##Creating train data using xtrain, ytrain & subject train
  trainDataX = read.table(file.path(sourcePath, "train", "X_train.txt"),header = FALSE)
  trainDataY = read.table(file.path(sourcePath, "train", "y_train.txt"),header = FALSE)
  subjectTrainData = read.table(file.path(sourcePath, "train", "subject_train.txt"),header = FALSE)
  
  
  
  #Create the features data
  featureData = read.table(file.path(sourcePath, "features.txt"),header = FALSE)
  #Create activity labels data
  activityLabelsData = read.table(file.path(sourcePath, "activity_labels.txt"),header = FALSE)
  
  #Providing proper variable names to test / train data set
  colnames(testDataY) = "activityid"
  colnames(subjectTestData) = "subjectid" 
  
  colnames(trainDataY) = "activityid"
  colnames(subjectTrainData) = "subjectid"
  
  
  ## Remove duplicate variables
  indexes <- which(!duplicated(featureData$V2))
  testDataX <- select(testDataX,indexes)
  trainDataX <- select(trainDataX,indexes)
  feature <- featureData$V2[indexes]
  
  
  colnames(testDataX) = feature
  colnames(trainDataX) = feature
  
  
  #Providing proper variable names to activity data set
  colnames(activityLabelsData) <- c("activityid","activitytype")
  
  #Creating full test data and train data set by merging subject and activity
  testFull = cbind(subjectTestData, testDataY, testDataX)
  
  trainFull = cbind(subjectTrainData, trainDataY, trainDataX)
  #Create the main data table merging both table tables - this is the outcome of 1
  test_train = rbind(trainFull, testFull)


  #Getting subset of data for mean and std
  
  mean_std <- select(test_train, matches("subjectid|activityid|[Mm]ean|[Ss]td"))
  
  # adding activity labels
  mean_std_activity_name = join(activityLabelsData,mean_std,type = "inner")

  # Create new tidy data set 
  tidyDataSet <- mean_std_activity_name %>% 
    group_by(activitytype,subjectid) %>%
    summarize_all(funs(mean)) %>%
    arrange(subjectid, activityid)

  #write tidy data set
  write.table(tidyDataSet, "./project/tidyDataSet.txt",row.name=FALSE)
  

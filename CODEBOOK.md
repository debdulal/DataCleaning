# Code Book


## Downloadded the data

1: The data is downloaded uusing 
download.file(zipurl,destFile)
2: Data is unziped using 
unzip(zipfile=destFile,exdir="./project")


## Description of the data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 



#### The dataset include following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


#### Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws



## First Look at Data
After doiwnloading the unzipped set of data files looked like this.
"code_book.txt.txt" "projectData.zip" "UCI HAR Dataset"

### List Of all files 
 [1] "activity_labels.txt"                          "features.txt"                                
 [3] "features_info.txt"                            "README.txt"                                  
 [5] "test/Inertial Signals/body_acc_x_test.txt"    "test/Inertial Signals/body_acc_y_test.txt"   
 [7] "test/Inertial Signals/body_acc_z_test.txt"    "test/Inertial Signals/body_gyro_x_test.txt"  
 [9] "test/Inertial Signals/body_gyro_y_test.txt"   "test/Inertial Signals/body_gyro_z_test.txt"  
[11] "test/Inertial Signals/total_acc_x_test.txt"   "test/Inertial Signals/total_acc_y_test.txt"  
[13] "test/Inertial Signals/total_acc_z_test.txt"   "test/subject_test.txt"                       
[15] "test/X_test.txt"                              "test/y_test.txt"                             
[17] "train/Inertial Signals/body_acc_x_train.txt"  "train/Inertial Signals/body_acc_y_train.txt" 
[19] "train/Inertial Signals/body_acc_z_train.txt"  "train/Inertial Signals/body_gyro_x_train.txt"
[21] "train/Inertial Signals/body_gyro_y_train.txt" "train/Inertial Signals/body_gyro_z_train.txt"
[23] "train/Inertial Signals/total_acc_x_train.txt" "train/Inertial Signals/total_acc_y_train.txt"
[25] "train/Inertial Signals/total_acc_z_train.txt" "train/subject_train.txt"                     
[27] "train/X_train.txt"                            "train/y_train.txt" 

## Data Analysis
README.txt provides complete details of all the files and their contents. 
We need ot read  and merge features.txt to get all the variables for X_test/X_train.txt. The subject deatils and activity labels are provided by subject_test.txt, subject_train.txt, activity_labels.txt.


## Reading data
Read activity, subject and text/train data to create test set and train set.

* Get variables from features
* Get test and train data
* Get activity labels and ids.
* Get subject ids.
* Get test /train labels

## Cleaning data, removal of duplicates
After analyzing the varibales duplicates are detected and those varibales are removed from the test and train data set.

## Processing data
Add meaning full names to the variables subjectid, activityid and activitytype
Data from  test/train label and test/train subject are merged to create new coloumns subjectid & activityid along with other variables
Getting subset only the measurements on the mean and standard deviation for each measurement along with subjectid & activityid.

Adding activity type to the data set based on activityid

Group the data set by activity id and subject id and then get mean for all varibales to create tidyDataSet.txt.

List of Varibales:
[1] "activitytype"                         "subjectid"                           
[3] "activityid"                           "tBodyAcc-mean()-X"                   
[5] "tBodyAcc-mean()-Y"                    "tBodyAcc-mean()-Z"                   
[7] "tBodyAcc-std()-X"                     "tBodyAcc-std()-Y"                    
[9] "tBodyAcc-std()-Z"                     "tGravityAcc-mean()-X"                
[11] "tGravityAcc-mean()-Y"                 "tGravityAcc-mean()-Z"                
[13] "tGravityAcc-std()-X"                  "tGravityAcc-std()-Y"                 
[15] "tGravityAcc-std()-Z"                  "tBodyAccJerk-mean()-X"               
[17] "tBodyAccJerk-mean()-Y"                "tBodyAccJerk-mean()-Z"               
[19] "tBodyAccJerk-std()-X"                 "tBodyAccJerk-std()-Y"                
[21] "tBodyAccJerk-std()-Z"                 "tBodyGyro-mean()-X"                  
[23] "tBodyGyro-mean()-Y"                   "tBodyGyro-mean()-Z"                  
[25] "tBodyGyro-std()-X"                    "tBodyGyro-std()-Y"                   
[27] "tBodyGyro-std()-Z"                    "tBodyGyroJerk-mean()-X"              
[29] "tBodyGyroJerk-mean()-Y"               "tBodyGyroJerk-mean()-Z"              
[31] "tBodyGyroJerk-std()-X"                "tBodyGyroJerk-std()-Y"               
[33] "tBodyGyroJerk-std()-Z"                "tBodyAccMag-mean()"                  
[35] "tBodyAccMag-std()"                    "tGravityAccMag-mean()"               
[37] "tGravityAccMag-std()"                 "tBodyAccJerkMag-mean()"              
[39] "tBodyAccJerkMag-std()"                "tBodyGyroMag-mean()"                 
[41] "tBodyGyroMag-std()"                   "tBodyGyroJerkMag-mean()"             
[43] "tBodyGyroJerkMag-std()"               "fBodyAcc-mean()-X"                   
[45] "fBodyAcc-mean()-Y"                    "fBodyAcc-mean()-Z"                   
[47] "fBodyAcc-std()-X"                     "fBodyAcc-std()-Y"                    
[49] "fBodyAcc-std()-Z"                     "fBodyAcc-meanFreq()-X"               
[51] "fBodyAcc-meanFreq()-Y"                "fBodyAcc-meanFreq()-Z"               
[53] "fBodyAccJerk-mean()-X"                "fBodyAccJerk-mean()-Y"               
[55] "fBodyAccJerk-mean()-Z"                "fBodyAccJerk-std()-X"                
[57] "fBodyAccJerk-std()-Y"                 "fBodyAccJerk-std()-Z"                
[59] "fBodyAccJerk-meanFreq()-X"            "fBodyAccJerk-meanFreq()-Y"           
[61] "fBodyAccJerk-meanFreq()-Z"            "fBodyGyro-mean()-X"                  
[63] "fBodyGyro-mean()-Y"                   "fBodyGyro-mean()-Z"                  
[65] "fBodyGyro-std()-X"                    "fBodyGyro-std()-Y"                   
[67] "fBodyGyro-std()-Z"                    "fBodyGyro-meanFreq()-X"              
[69] "fBodyGyro-meanFreq()-Y"               "fBodyGyro-meanFreq()-Z"              
[71] "fBodyAccMag-mean()"                   "fBodyAccMag-std()"                   
[73] "fBodyAccMag-meanFreq()"               "fBodyBodyAccJerkMag-mean()"          
[75] "fBodyBodyAccJerkMag-std()"            "fBodyBodyAccJerkMag-meanFreq()"      
[77] "fBodyBodyGyroMag-mean()"              "fBodyBodyGyroMag-std()"              
[79] "fBodyBodyGyroMag-meanFreq()"          "fBodyBodyGyroJerkMag-mean()"         
[81] "fBodyBodyGyroJerkMag-std()"           "fBodyBodyGyroJerkMag-meanFreq()"     
[83] "angle(tBodyAccMean,gravity)"          "angle(tBodyAccJerkMean),gravityMean)"
[85] "angle(tBodyGyroMean,gravityMean)"     "angle(tBodyGyroJerkMean,gravityMean)"
[87] "angle(X,gravityMean)"                 "angle(Y,gravityMean)"                
[89] "angle(Z,gravityMean)" 

---
title: "Getting and Cleaning Data Project"
author: "Fazar"
date: "November 19, 2015"
output: html_document
---

Experimental Design :
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Original Dataset :
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Processed data :
the Processed dataset is made to be a tidy dataset. its only extract the measurement of the mean and standard deviation for each subject in each activity, its left us 79 variable and add the subject, activity and activity code variable. grouping the subject for each activity left 180 observation in the dataset. so the dimension of the dataset is 82 variable and 180 observation.

Variable name :
notice t and f in each of variable means time and fourier.
after that there is body and gravity.
and then there is acc and gyro means the data is came from accelerometer for acc and gyroscope for gyro.
notice there is variable with "jerk" it means this is jerk signal data
and "mag" it means magnitude of these three-dimensional signals, calculated using euclidean norm
and after that there is mean and std, its clearly tell us which measurement is being measure in data
and there is x,y,z that means the axis where the data is extract.
other than that there is subject variable and activitycode
activity variable is explaining the activitycode.
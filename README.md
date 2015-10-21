# Summary analysis of mobile phone accelerometer data

The script 'run_analysis.R' can be used to create a summary dataset of data
collected from accelerometers on devices such as the Samsung Galaxy S smart-
phone.

The script is designed to be used with data from UCI. The raw dataset can be
downloaded from the following source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In order to run this script, R's working directory must be set as the directory
containing the raw dataset. This directory must be named "UCI HAR Dataset". If
another directory is set as the working directory, the script will not execute.

The script calculates the mean and standard deviation for each normalized feature 
vector provided in the source dataset. Based on this dataset, the mean of the mean
and the mean of the standard deviation of each feature vector is calculated for
each subject and activity type in the original dataset.

## Output "code book"

 - Activity type: a text string describing the type of activity performed when measuring
 - Subject: an integer variable identifying each distinct subject
 - mean: mean value per activity type and subject of the mean normalized feature 
   vector for each observation in the raw dataset
 - sdmean: mean value per activity type and subject of the standard deviation of
   the normalized feature vector for each observation in the raw dataset
   
Mean and sdmean are unitless measurements. The original feature vector elements
takes values between -1 and +1.
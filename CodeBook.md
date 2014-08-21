<h1>Data</h1>
__________________________

The data began as the set of files described in the /UCI HAR Dataset/README.txt, UCI HAR Dataset/features.txt, and other accompanying files to the UCI HAR Dataset. It was transformed as described below to become a set that gives the averages of the variable measurements for each study participant performing each activity.



<h1>Variables</h1>
---------------------------

id:

Activity: the activity performed by the subject, taken from the list in /UCI HAR Dataset/activity_labels.txt
<br>
Subject: An identifying number from 1 to 30 that signifies on which subject the measurements were taken

measurement:

(Excerpt taken from /UCI HAR Dataset/features_info.txt)
<br>((Note that the descriptions for the variables as they appear in this data set only change in that they are the averaged values of the variables described in the UCI HAR Dataset -- as explained below in Transformations))

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ<br>
tGravityAcc-XYZ<br>
tBodyAccJerk-XYZ<br>
tBodyGyro-XYZ<br>
tBodyGyroJerk-XYZ<br>
tBodyAccMag<br>
tGravityAccMag<br>
tBodyAccJerkMag<br>
tBodyGyroMag<br>
tBodyGyroJerkMag<br>
fBodyAcc-XYZ<br>
fBodyAccJerk-XYZ<br>
fBodyGyro-XYZ<br>
fBodyAccMag<br>
fBodyAccJerkMag<br>
fBodyGyroMag<br>
fBodyGyroJerkMag<br>

The set of variables that were estimated from these signals are: 

mean(): Mean value<br>
std(): Standard deviation



<h1>Transformations</h1>
__________________________

This is a description of exactly what process the script performs to the change the data to achieve the desired result:<br>
1. Read the test and train data into R and save them as R objects<br>
2. Bind the test and train data together into one large, messy, all-inclusive data frame<br>
3. Extract the feature measurement names from the /UCI HAR Dataset/features.txt file<br>
4. Append the names "Subject" and "Activity" to names extracted from the file in step 3, use this object to name the columns of the data frame created in step 2<br>
5. Subset the large, messy dataframe to remove only the columns containing the mean or standard deviation of measurements (as well as the Subject and Activity data), saving this information in a new data frame<br>
6. Create a character vector containing the names of the activities performed, with indices matching their order, given by the /UCI HAR Dataset/activity_labels.txt file<br>
7. Use this vector and a for loop to insert those names to replace the numbers in the Activity column of the most recently created data frame<br>
8. Load the reshape2 package and melt the most recently created data frame, then use dcast to arrange the means of the measurement variables with relation to each subject's performance on each activity<br>
9. Create a text file in the working directory called "TidyDataCoursera.txt" and write the tidied data to that file<br>

The tidied data can be read using a simple read.table() call in R without any special parameters.
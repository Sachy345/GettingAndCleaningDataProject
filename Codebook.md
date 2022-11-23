# Getting And Cleaning Data Project CodeBook

The data set used for this analysis was part of a project from the Coursera course [Getting And Cleaning Data](https://www.coursera.org/learn/data-cleaning). Data was collected from the accelerometers from the Samsung Galazy S smartphone by D. Anguita et al in 2013 (<https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>).

## Cleaning The Data

The original data sets were split into Test and Training sets because the data was intended for machine learning. Since an analysis is to be done on data from all subjects, we combined the Test and Training data into one data set. This left us with two data sets of

-   All data from the accelerometers
-   Activity labels and the corresponding numeric code

For easier reading, the activity labels data set was joined with the accelerometer data replacing the numeric code. Mean and Standard Deviation Variables were looked at for this project, so only these measurements were extracted. Lastly the names for the variables were changed to be more clear and consistent. Analysis was done on this new data set.

The following is an excerpt from the "features_info.txt" which explains in detail the processing of the raw signal data.

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

> These signals were used to estimate variables of the feature vector for each pattern:\
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ\
> tGravityAcc-XYZ\
> tBodyAccJerk-XYZ\
> tBodyGyro-XYZ\
> tBodyGyroJerk-XYZ\
> tBodyAccMag\
> tGravityAccMag\
> tBodyAccJerkMag\
> tBodyGyroMag\
> tBodyGyroJerkMag\
> fBodyAcc-XYZ\
> fBodyAccJerk-XYZ\
> fBodyGyro-XYZ\
> fBodyAccMag\
> fBodyAccJerkMag\
> fBodyGyroMag\
> fBodyGyroJerkMag

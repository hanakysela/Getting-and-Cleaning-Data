# Human Activity Recognition Using Smartphones

## Source of data
The data was downloaded from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
The variables as well as all the data-related info: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## The Data

The original datataset contain information about six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by a group of 30 volunteers wearing a smartphone (Samsung Galaxy S II) on the waist, where was capture 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the accelerometer and gyroscope embedded in the smartphone.  

The dataset includes files while not all of them were necessary for the Project. The necessary files can be found in the [Github repo](https://github.com/hanakysela/Getting-and-Cleaning-Data):  
- ```Test``` and ```train``` folders with the raw data  
- ```activity_labels.txt```  
- ```features.txt```  

### The content of each file:  
- ```activity_labels.txt```  6 activities, each has an ID and human-readable description (e.g. 1= WALKING, 2=WALKING_UPSTAIRS, ...)
- ```features.txt```  list of variables that describe the data obtained from gyroscopes, accelerometers, thermometers, ... The raw data has already been processed and the data available from this processing usually covers "summary" information. The variables describe e.g. standard deviation of accelerometer by the x-axis, ...) There is 561 features.
-  ```train/X-train.txt``` contains the vaules obtained, the variables are however not properly named. 7352 observations of the 561 features for 21 out of 30 voluteers.
- ```train/subject_train.txt``` A vector of 7352 integers, describing  the ID of the volunteer related to each of the observations in ```X_train.txt```.  
- ```train/Y-train.txt``` A vector of 7352 integers, training labels. Values (1-6), these values correspond to activities described in ```activity_labels.txt```
- ```test```folder contains three .txt files with similar data as in ```train``` folder, however the data covers the other 9 volunteer out of 30.

For the purpose of this project, the test and train data were merged and cleaned up.


## Operations with the Data
The  ```run_analysis.R``` script performs the following operations on the data:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
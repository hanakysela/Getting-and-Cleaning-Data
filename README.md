# Getting and Cleaning Data - Project


During November 2014 when I took the course for about third time, I was finally able to even start working on the Course Project.

## The Goal:

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names.  
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Depencendencies:
- ```reshape2``` 
- ```data.table```   

The R script installs the package itself when needed.


### This repo contains:  
##### data that will be used by the R script to do the required operations:

- train data in a ```train```  folder
- test data in a ```test``` folder
- ```activity_labels.txt```
- ```features.txt```

##### information about the process and the outcome

- final.txt the outcome of the process
- readme.md short info about everything
- CodeBook.md description of the data used for this project


-------------------------------------
###What does the scrip do?

Every step the ```run_analysis.R``` script does is commented already in the code.

1. Reads all the data and merges the training and the test sets to create one data set using ```read.table``` and ```rbind``` and ```cbind```.
Then it renames the columns properly

2. Keeps only those columns that have "std" or "mean" in their names (and the test.ID and activity.code, too). Using ```grep``` command, I was able to index colums I wanted to keep in the dataset, and then subset the dataset with these indeces.

3. Uses descriptive activity names to name the activities in the data set


4. Changes "tBodyAcc-mean()-X" to something that is easy to read.  
Using ```gsub``` command, I have changed:
	- ^t to Time
	- ^f to Frequency
	- -mean to Mean
	- -std to StdDev

5. Melts the data by Subject's ID and the Activity in order to get the average value for each varible "separated" by Subject's ID and the activity they were performing.  Finally it writes the data to a tidy dataset called ```final.txt```.
## 1. Merges the training and the test sets to create one data set.

#read all the required data in

X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")

Y_train <- read.table("train/y_train.txt")
Y_test <- read.table("test/y_test.txt")

S_train <- read.table("train/subject_train.txt")
S_test <- read.table("test/subject_test.txt")

features <- read.table("features.txt")
activities <-  read.table("activity_labels.txt")



#merge train and test data together

X<-rbind(X_train, X_test) #data
Y<-rbind(Y_train, Y_test) #activities
S<-rbind(S_train, S_test) #subjects



#names the columns properly
names(X) <- features[, 2]
names(Y) <- "Activity"
names(S) <- "subject.ID"


#merge all the data together
alldata <- cbind(S, Y, X)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

#keep only those columns that have "std" or "mean" in their names (and the test.ID and activity.code, too)

keep.columns <- grep("(mean|std)\\(\\)", names(alldata))


# keep only the mean or std columns, as well as column 1 and  2
data <- alldata[ , c(1,2, keep.columns)]


## 3. Uses descriptive activity names to name the activities in the data set

#replace codes 1:6 with text (from activities)
data[,2] = activities[data[,2], 2]



## 4. Appropriately labels the data set with descriptive variable names.

# change "tBodyAcc-mean()-X" to something that is easy to read. What?!?

names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("-mean\\(\\)", "Mean", names(data))
names(data) <- gsub("-std\\(\\)", "StdDev", names(data))


## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.


library(reshape2)
data01 <- melt(data, id=c("subject.ID","Activity"))
final <- dcast(data01, subject.ID+Activity ~ variable, mean)

# see if it worked OK
final

# write data
write.table(final, "final.txt", row.names = FALSE)
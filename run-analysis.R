
#load packages
library(dplyr)

# Download the dataset
filename<- "Dataset.zip"
if(!file.exists(filename)){
        fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file (fileurl , "Dataset.zip")
}

# Unzip the dataset
if(!file.exists("UCI HAR Dataset")){
    unzip(filename)
}

#define the path where the new folder has been unzipped
datapath = file.path(getwd(), "UCI HAR Dataset")

#read data features
features = read.table(file.path(datapath, "features.txt"), col.names = c("n", "functions"))

#read activity labels
activity_labels = read.table(file.path(datapath, "activity_labels.txt"), col.names = c("code", "activity"))

#read train data
x_train = read.table(file.path(datapath, "train", "X_train.txt"), col.names = features$functions)
y_train = read.table(file.path(datapath, "train", "y_train.txt"), col.names = "code")
subject_train = read.table(file.path(datapath, "train", "subject_train.txt"), col.names = "subject")

#read test data
x_test = read.table(file.path(datapath, "test", "X_test.txt"), col.names = features$functions)
y_test = read.table(file.path(datapath, "test", "y_test.txt"), col.names = "code")
subject_test = read.table(file.path(datapath, "test", "subject_test.txt"), col.names = "subject")

#merge the train and test data
merge_train = cbind(y_train, subject_train, x_train)
merge_test = cbind(y_test, subject_test, x_test)

#merge train to test data to create data set
merge_data = rbind(merge_train, merge_test)

#extract mean and standard deviation
tidy_data <- select(merge_data, subject, code, contains("mean"), contains("std"))

#name variables using activity labels table
tidy_data$code <- activity_labels[tidy_data$code, 2]

#rename variables more clearly
names(tidy_data)[2] = "activity"
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data)<-gsub("^t", "Time", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("tBody", "Time_Body", names(tidy_data))
names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data))
names(tidy_data)<-gsub("-std()", "std", names(tidy_data))
names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))
names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))


final_data <- summarize_all(group_by(tidy_data, subject, activity), mean)

#write to a text file
write.table(final_data, "final_data.txt", row.name=FALSE)


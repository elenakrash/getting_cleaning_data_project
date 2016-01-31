#1. Merges the training and the test sets to create one data set

#Download the file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
#Unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#Get the list of the files
path <- file.path("./data" , "UCI HAR Dataset")
files <- list.files(path, recursive=TRUE)

#Read training and test sets
test  <- read.table(file.path(path, "test", "X_test.txt" ),header = FALSE)
training <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)
#Read training and test labels
testLabels  <- read.table(file.path(path, "test", "y_test.txt" ),header = FALSE)
trainingLabels <- read.table(file.path(path, "train", "y_train.txt"),header = FALSE)
#Read features
features <- read.table(file.path(path, "features.txt"), colClasses = c("character"), header = FALSE)
#Read activity labels
activityLabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)
#Read subject data
testSubject <- read.table(file.path(path, "test", "subject_test.txt" ),header = FALSE)
trainingSubject <- read.table(file.path(path, "train", "subject_train.txt" ),header = FALSE)

# Assigin column names to the data
colnames(activityLabels)  <- c('activityid','activitytype')
colnames(testSubject)  <- "subjectid"
colnames(trainingSubject) <- "subjectid"
colnames(testLabels) <- "activityid"
colnames(trainingLabels) <- "activityid"

#Create the final data
testData <- cbind(cbind(test, testSubject), testLabels)
traingData <- cbind(cbind(training, trainingSubject), trainingLabels)
finalData <- rbind(testData,traingData)

# Label columns
labels <- rbind(rbind(features, c(562, "subjectid")), c(563, "activityid"))[,2]
names(finalData) <- labels

#2. Extracts only the measurements on the mean and standard deviation for each measurement

finalData_mean_std <- finalData[,grepl("mean|std|subjectid|activityid", names(finalData))]

#3. Uses descriptive activity names to name the activities in the data set

finalData_mean_std <- join(finalData_mean_std, activityLabels, by = "activityid", match = "first")
finalData_mean_std <- finalData_mean_std[,-1]

#4. Appropriately labels the data set with descriptive variable names

# Remove parentheses
names(finalData_mean_std) <- gsub('\\(|\\)',"",names(finalData_mean_std), perl = TRUE)

# Make clearer names
names(finalData_mean_std) <- gsub("^f", "frequency", names(finalData_mean_std))
names(finalData_mean_std) <- gsub("^t", "time", names(finalData_mean_std))
names(finalData_mean_std) <- gsub("Acc","Acceleration",names(finalData_mean_std))
names(finalData_mean_std) <- gsub("GyroJerk","AngularAcceleration",names(finalData_mean_std))
names(finalData_mean_std) <- gsub("Gyro","AngularSpeed",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('Mag',"Magnitude",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('Freq\\.',"Frequency.",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('Freq$',"Frequency",names(finalData_mean_std))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#   each variable for each activity and each subject.

tidyFinalData = ddply(finalData_mean_std, c("subjectid","activitytype"), numcolwise(mean))
write.table(tidyFinalData, file = "tidyFinalData.txt")

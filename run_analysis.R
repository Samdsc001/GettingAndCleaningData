#run_analysis.R

getwd()
#1. Merges the training and the test sets to create one data set.

trainingSet <- read.table("train/X_train.txt")
trainingLabel <- read.table("test/X_test.txt")
trainingCombined <- rbind(trainingSet, trainingLabel)

testSet <- read.table("train/subject_train.txt")
testName <- read.table("test/subject_test.txt")
testingCombined <- rbind(testSet, testName)

trainSubject <- read.table("train/y_train.txt")
testSubject <- read.table("test/y_test.txt")
SubjectCombined <- rbind(trainSubject, testSubject)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
criteria <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
trainingCombined <- trainingCombined[, criteria]
names(trainingCombined) <- gsub("\\(\\)", "", features[criteria, 2])


# 3. Uses descriptive activity names to name the activities in the data set.

activity <- read.table("activity_labels.txt")
activity[, 2] = gsub("_", "", activity[, 2])
SubjectCombined[,1] = activity[SubjectCombined[,1], 2]
names(SubjectCombined) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(testingCombined) <- "subject"
mergedClean <- cbind(testingCombined, SubjectCombined, trainingCombined)
write.table(mergedClean, "cleanData.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

 
uniqTests <- length(table(testingCombined))
totalTests = length(unique(testingCombined)[,1])
totalActivities = length(activity[,1])
totalColumns = dim(mergedClean)[2]
result = mergedClean[1:(totalTests*totalActivities), ]

row = 1
for (x in 1:totalTests) {
  for (a in 1:totalActivities) {
    result[row, 1] = uniqTests[x]
    result[row, 2] = activity[a, 2]
    tmp <- mergedClean[mergedClean$subject==x & mergedClean$activity==activity[a, 2], ]
    result[row, 3:totalColumns] <- colMeans(tmp[, 3:totalColumns])
    row = row+1
  }
}

#final dataset
write.table(result, "averages_dataset.txt",row.name=FALSE)

 

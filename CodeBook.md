---
title: "Code Book"
output: html_document
---

This code book will describe the variables used in the attached run_analysis.R script

1) The script will read train/X_train.txt and test/X_test.txt into trainingSet and trainingLabel variables respectively.   This data is then combined and stored in the trainingCombined variable.

2) The script will read train/subject_train.txt and test/subject_test.txt into testSet and testName variables respectively.   This data is then combined and stored in the testingCombined variable.

3) The script will read train/y_train.txt and test/y_test.txt into trainSubject and testSubject variables respectively.   This data is then combined and stored in the SubjectCombined variable.

4) Read the features.txt file from the "/data" folder and store the data in a variable called features. Measurements on the mean and standard deviation are extracted for further use. Column names are cleaned to remove "()" and "-" characters.  

5) Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity. Column names are cleaned to remove underscores(_).  

6) Combine the testingCombined, SubjectCombined and trainingCombined by column to get a new cleaned 10299x68 data frame, mergedClean.  

7) Write the mergedClean data into a " cleanData.txt " file in current working directory.

8) A second file, an independent tidy data set with the average of each variable for each activity and each subject is created using multiple for loops and getting the average of each measurement. The 'averages_dataset.txt' file is created at the end of this process in the current working directory. 


###CodeBook

=================================

The original data for this project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



The original description: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* R script run_analysis.r performs the folling steps to clean the data.

1. Read all of the files, X_test.txt, X_train.txt, y_test.txt, y_train.txt, subject_test.txt, subject_train.txt
2. Merge the train and test files together. 
    
- The result of datX(X_test and X_train )is a 10299X66 data frame. 
- The result of datY(y_test and y_train) is a 10299X1 data frame with activity IDs. 
    
- The result of datS(subject_test and subject_train) is a 10299X1 data frome with subject IDs.

3. Extracts the measurements on the mean and standard deviation from features.txt file. The result in a 66 indices list.


4. Read the activity_labels.txt file and make all names to lower cases. Then, uses descriptive activity names to name the activities in the data set.

 	V1	V2
1	1	walking
2	2	walkingupstairs
3	3	walkingdownstairs
4	4	sitting
5	5	standing
6	6	laying

5. Combine the datX, datS and datY by column to a new 10299x68 data frame, called data. Name the first two colums, "subject" and "activity".
6. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. It is a 180x68 data frame. There are 30 unique subjects and 6 unique activites, which reult in a 180 combinations of the subject and activites. 
7. Save the result as tidy_data.txt.

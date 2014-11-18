# Read all of data

Xtrain <- read.table("train/X_train.txt") 
Xtest <- read.table("test/X_test.txt") 
Strain <- read.table("train/subject_train.txt") 
Stest<- read.table("test/subject_test.txt") 
Ytrain <- read.table("train/y_train.txt") 
Ytest<- read.table("test/y_test.txt") 

# Merges the training and the test sets 

datX<- rbind(Xtrain, Xtest) 
datS <- rbind(Strain,Stest) 
datY <- rbind(Ytrain, Ytest) 

# Extracts only the measurements on the mean and standard deviation for each measurement. 


features <- read.table("features.txt") 
f_means_std <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) 
datX <- datX[, f_means_std] 
names(datX) <- features[f_means_std, 2] 
names(datX) <- gsub("\\(|\\)", "", names(datX),tolower(names(datX))) 


# Uses descriptive activity names to name the activities in the data set 


activities <- read.table("activity_labels.txt") 
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2]))) 
datY[,1] = activities[datY[,1], 2] 
names(datY) <- "activity" 

# Appropriately labels the data set with descriptive activity names. 

names(datS) <- "subject" 
data <- cbind(datS, datY, datX) 




# Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject. 

uSubjects = unique(datS)[,1] 
nSubjects = length(unique(datS)[,1]) 
nActivities = length(activities[,1]) 
numCols = dim(data)[2] 
R = data[1:(nSubjects*nActivities), ] 


row = 1 
for (sub in 1:nSubjects) 
{ 
  for (act in 1:nActivities) 
  { 
    R[row, 1] = uSubjects[sub] 
    R[row, 2] = activities[act, 2] 
    tmp <- data[data$subject==sub & data$activity==activities[act, 2], ] 
    R[row, 3:numCols] <- colMeans(tmp[, 3:numCols]) 
    row = row+1 
  } 
} 
write.table(R, "tidy_data.txt") 



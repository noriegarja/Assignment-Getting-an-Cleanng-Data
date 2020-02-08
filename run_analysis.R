## Open File in RStudio named Run_analysis R
## Set the working directoriy after unzip the files in my Documents /R/UCI HAR DataSet
## Setwd("~/R/UCI HAR Dataset"))

## read dplyr library

library(dplyr)

## Read data Training and test using read.table()

trainingSubjects<-read.table(file.path("train","subject_train.txt")) 
trainingValues<-read.table(file.path("train","X_train.txt"))
trainingActivity<-read.table(file.path("train","y_train.txt"))

testSubjects<-read.table(file.path("test","subject_test.txt"))
testValues<-read.table(file.path("test","X_test.txt"))
testActivity<-read.table(file.path("test","y_test.txt"))

## Read labels as features and activities and define columns names
features<-read.table(file.path("features.txt"),as.is = TRUE)
activities<-read.table(file.path("activity_labels.txt"))
                     
colnames(activity)<-c("activityId","activityLabel")

## (1) Creating the final DataSet with the merge 

humanActivity<- rbind(cbind(trainingSubjects, trainingValues, trainingActivity),cbind(testSubjects,testValues,testActivity))

colnames(humanActivity)<-c("subject",features[,2],"activity")

## (2) Extrating only the data to the mean and SD 

ColumnsToEstract<-grepl("subject|activity|mean|SD",colnames(humanActivity))

humanActivity<-humanActivity[,ColumnsToEstract]

## (3) Names the activities in the data set

humanActivity$activity <-factor(humanActivity$activity,levels = activities[,1],labels = activities[,2])

## (4) Appropriately lable the data set with descriptive variable names

humanActivityCols<-colnames(humanActivity)

humanActivityCols<-gsub("[\\(\\)-]","",humanActivityCols) ## removing characters

humanActivityCols<-gsub("^f","frecuencyDomain",humanActivityCols)
humanActivityCols<-gsub("^t","timeDomain",humanActivityCols)
humanActivityCols<-gsub("Acc","Accelerometer",humanActivityCols)
humanActivityCols<-gsub("Gyro","Gyroscope",humanActivityCols)
humanActivityCols<-gsub("Mag","Magnitude",humanActivityCols)
humanActivityCols<-gsub("Freq","frecuency",humanActivityCols)
humanActivityCols<-gsub("mean","Mean",humanActivityCols)
humanActivityCols<-gsub("SD","SatandarDeviation",humanActivityCols)

colnames(humanActivity)<-humanActivityCols

## (5) from 4, create a Tidy Data table with each variable data

humanActivityAverage<-humanActivity%>%
  group_by(subject,activity)%>%
  summarise_each(funs(mean))

write.table(humanActivityAverage,"tidy_data.txt",row.names = FALSE)
  
## end









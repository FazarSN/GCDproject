# reading the dataset
setwd("/home/fazar/Downloads/UCI HAR Dataset/")
traindata<-read.table("train/X_train.txt")
testdata<-read.table("test/X_test.txt")
trainactivity<-read.table("train/y_train.txt")
testactivity<-read.table("test/y_test.txt")
trainsubject<-read.table("train/subject_train.txt")
testsubject<-read.table("test/subject_test.txt")

#merging dataset into one
fulldata<-rbind(traindata,testdata)

#finding mean and std column
feature<-read.table("features.txt")
colname<-as.character(feature$V2)
meancol<-grep("mean", colname)
stdcol<-grep("std", colname)

#extract the mean and std column data
library(dplyr)
mean_data <- fulldata %>% select(meancol)
std_data <- fulldata %>% select(stdcol)

#giving the dataset appropriate header
meancolname<-colname[meancol]
stdcolname<-colname[stdcol]
colnames(mean_data) <- meancolname
colnames(std_data) <- stdcolname

#once again merge the dataset
mean_std_data<-cbind(mean_data, std_data)

#add subject to the dataset
fullsubject<-rbind(trainsubject, testsubject)
colnames(fullsubject) <- "subject" #giving the subject activity variable name
mean_std_data_withsubject<-cbind(fullsubject, mean_std_data)

#make R read activity information
fullactivity<-rbind(trainactivity, testactivity)
colnames(fullactivity) <- "activitycode" #giving the activity variable name
data_withsubject_withactivitycode<-cbind(mean_std_data_withsubject, fullactivity)
activitylabel<-read.table("activity_labels.txt")
colnames(activitylabel) <- c("activity_code", "activity")

#edit the activity name and create new dataset
fulldata_new<-merge(data_withsubject_withactivitycode, activitylabel, by.x="activitycode", by.y="activity_code")

#edit the variable names
colname<-names(fulldata_new)
lowercolname<-tolower(colname)
erasetheparenthesis<-gsub("\\()","",lowercolname)
changelinetodot<-gsub("-",".",erasetheparenthesis)
newcolname<-changelinetodot
colnames(fulldata_new)<-newcolname

#create tidy average (each variable) for each subject and each activity data
fulldataedit<-tbl_df(fulldata_new)
tidydata<-fulldataedit %>% 
  group_by(subject, activity) %>% 
  summarise_each(funs(mean))

write.table(tidydata, file="tidy_data.txt", row.names = FALSE)
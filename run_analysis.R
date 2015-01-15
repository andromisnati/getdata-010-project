setwd("D:/Users/dia/Downloads/getting-cleaning-data/git/getdata-010-project")

#Reading Data
##Features
features<-read.table("UCI HAR Dataset/features.txt",sep=" ")
colnames(features)<-c("id","name")

##Activities
activities<-read.table("UCI HAR Dataset/activity_labels.txt",sep=" ")
colnames(activities)<-c("id","name")

data1<-read.table("UCI HAR Dataset/train/X_train.txt",col.names = features[,2])
label1<-read.table("UCI HAR Dataset/train/Y_train.txt",col.names="label")
subject1<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names="subject")

data2<-read.table("UCI HAR Dataset/test/X_test.txt",col.names = features[,2])
label2<-read.table("UCI HAR Dataset/test/Y_test.txt",col.names="label")
subject2<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names="subject")

#Just the Mean & STD features (and subject & label)
meanfeatures<-features[grep("mean", features$name), ]
stdfeatures<-features[grep("std", features$name), ]
rm(features) #cleaning memory

#Merging data with just Mean & Std features
data<-rbind(data1,data2)
rm(data1) #cleaning memory
rm(data2) #cleaning memory
data<-data[, c(meanfeatures$id,stdfeatures$id)]
rm(meanfeatures) #cleaning memory
rm(stdfeatures) #cleaning memory

#Activity labels to text
label<-rbind(label1,label2)
rm(label1) #cleaning memory
rm(label2) #cleaning memory
activity<-rep("",nrow(label))
for (i in 1:nrow(label))
{  activity[i] <- as.character(activities$name[as.numeric(label$label[i])]) }
rm(activities) #cleaning memory
rm(label) #cleaning memory
rm(i) #cleaning memory

#List of subjects
subject<-rbind(subject1,subject2)
rm(subject1) #cleaning memory
rm(subject2) #cleaning memory

#All in one dataset => Labels as Activity, Subject, Data [Means & STD]
data<-cbind(activity,subject,data)
rm(activity) #cleaning memory
rm(subject) #cleaning memory

#Create Tidy data of the Means By Activity & Subject

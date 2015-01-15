setwd("D:/Users/dia/Downloads/getting-cleaning-data/git/getdata-010-project")

#Reading Data
features<-read.table("UCI HAR Dataset/features.txt",sep=" ")
colnames(features)<-c("id","name")

data1<-read.table("UCI HAR Dataset/train/X_train.txt",col.names = features[,2])
label1<-read.table("UCI HAR Dataset/train/Y_train.txt",col.names="label")
subject1<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names="subject")

data2<-read.table("UCI HAR Dataset/test/X_test.txt",col.names = features[,2])
label2<-read.table("UCI HAR Dataset/test/Y_test.txt",col.names="label")
subject2<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names="subject")

#Just the Mean & STD features (and subject & label)
Meanfeatures<-features[grep("mean", features$name), ]
stdfeatures<-features[grep("std", features$name), ]

#Merging data
data<-rbind(data1,data2)
data<-data[, c(Meanfeatures$id,stdfeatures$id)]

label<-rbind(label1,label2)
subject<-rbind(subject1,subject2)
data<-cbind(label,subject,data)

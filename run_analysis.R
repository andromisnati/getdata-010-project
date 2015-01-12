setwd("D:/Users/dia/Downloads/getting-cleaning-data")
features<-read.table("UCI HAR Dataset/features.txt",sep=" ")

data1<-read.table("UCI HAR Dataset/train/X_train.txt",col.names = features[,2])
label1<-read.table("UCI HAR Dataset/train/Y_train.txt",col.names="label")
subject1<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names="subject")

data2<-read.table("UCI HAR Dataset/test/X_test.txt",col.names = features[,2])
label2<-read.table("UCI HAR Dataset/test/Y_test.txt",col.names="label")
subject2<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names="subject")

data<-rbind(data1,data2)
label<-rbind(label1,label2)
subject<-rbind(subject1,subject2)

data<-cbind(label,subject,data)

features<-[features]


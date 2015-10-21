
# This code cleans the "Human Activity Recognition Using Smartphones Data Set"
# for Coursera course "Getting and Cleaning Data"

run_analysis <- function() {
      
      # load plyr
      library(plyr)
      
      # set / verify working directory
      wd <- getwd()
      if(!grepl("UCI HAR Dataset",wd)) {
            stop("Working directory not recognized. Set working directory to \"UCI HAR Dataset\"")
      }
      
      # load datasets
      
      # load training set
      training_set <- read.table("./train/X_train.txt",sep="",header=FALSE)
      training_labels <- read.table("./train/Y_train.txt",sep="",header=FALSE)
      training_subject <- read.table("./train/subject_train.txt",sep="",header=FALSE)
      
      # load test set
      
      test_set <- read.table("./test/X_test.txt",sep="",header=FALSE)
      test_labels <- read.table("./test/Y_test.txt",sep="",header=FALSE)
      test_subject <- read.table("./test/subject_test.txt",sep="",header=FALSE)
      
      # load activity labels
      
      activities <- read.table("activity_labels.txt",sep="",header=FALSE)
      
      # join data sets
      
      set <- rbind(test_set,training_set)
      labels <- rbind(test_labels,training_labels)
      Subject <- rbind(test_subject,training_subject)
      
      # calculate statistics
      Means <- apply(set,1,mean)
      SD <- apply(set,1,sd)
      
      # merge label dataset with activity names
      
      activityType <- merge(labels,activities,by.x="V1",by.y="V1")
      
      output <- cbind(activityType[,2],Subject,Means,SD)
      names(output) <- c("ActivityType","Subject","Mean","SD")
      
      # create summary data table
      output.summary <- ddply(output,
                              c("ActivityType","Subject"), 
                              summarise, 
                              mean = mean(Mean), 
                              sdmean = mean(SD))
                            
}
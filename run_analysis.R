library(plyr)
library(reshape2)
#STEP 1: Merges the training and the test sets to create one data set.
  
  # First we read in all the data from files
    #TRAINING
    
    features     <- read.table('UCI HAR Dataset//features.txt'); 
    activity_labels <- read.table('UCI HAR Dataset//activity_labels.txt') 
    subject_train <- read.table('UCI HAR Dataset//train//subject_train.txt') 
    x_train   <- read.table('UCI HAR Dataset//train//x_train.txt') 
    y_train   <- read.table('UCI HAR Dataset//train//y_train.txt')
    #TEST
    subject_test <- read.table('UCI HAR Dataset//test//subject_test.txt') 
    x_test    <- read.table('UCI HAR Dataset//test//x_test.txt')
    y_test    <- read.table('UCI HAR Dataset//test//y_test.txt') 
    #TRAINING
    colnames(activity_labels)  <- c('ID','Type')
    colnames(subject_train)  <- "SubjectId"
    colnames(x_train)   <- features[,2] 
    colnames(y_train)   <-"ActivityId"
    #TEST
    colnames(subject_test) <- "SubjectId"
    colnames(x_test)  <- features[,2]; 
    colnames(y_test)  <- "ActivityId";
  
  #Merge into one data set
  final_data <- rbind( cbind(y_train,subject_train,x_train),
                       cbind(y_test,subject_test,x_test))
    
#STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
  features <- read.table("UCI HAR Dataset//features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
  mean_and_std_features <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
  mean_and_std_data <- final_data[, c(1, 2, mean_and_std_features$V1+2)]
    
#STEP 3: Uses descriptive activity names to name the activities in the data set
  mean_and_std_data$ActivityId <- activity_labels[mean_and_std_data$ActivityId, 2]
    
#STEP 4: Appropriately labels the data set with descriptive variable names.
  colNames_list <- c("subject", "label", mean_and_std_features$V2)
  colNames_list <- gsub("[^[:alpha:]]", "", colNames_list) 
  colnames(mean_and_std_data) <- colNames_list

#STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- ddply(melt(mean_and_std_data, 
                        id.vars=c("subject", "label")), 
                        .(subject, label), 
                        summarise, 
                        MeanSamples=mean(value))
write.table(tidy_data, 'tidydata.txt',row.names=FALSE,sep='\t');
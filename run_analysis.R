run_analysis <- function() {
        ## STEP 1 merge training and test sets to make one data set
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
        X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
        test <- cbind(subject_test,Y_test,X_test)
        train <- cbind(subject_train,Y_train,X_train)
        dat1 <- rbind(test,train)
        ## STEP 2 extract only the measurements on the mean and
        ## standard dev for each measurement
        ## AND STEP 4 appropriately label data set with descriptive
        ## variable names
        features <- read.table("./UCI HAR Dataset/features.txt")
        featurenamesPlus <- c("Subject","Activity", as.character(features[1:561,2]))
        colnames(dat1) <- featurenamesPlus
        dat2 <- dat1[,grepl("^Subject|^Activity|std\\(\\)|mean\\(\\)",colnames(dat1))]
        ## STEP 3 use descriptive activity names to name the activities
        ## in the data set
        actNames <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")
        actNamesCol <- c()
        for (i in 1:10299) {
                actNamesCol <- c(actNamesCol,actNames[as.numeric(dat2[i,2])])
        }
        dat2[,2] <- actNamesCol
        ## STEP 5 create second, independent, tidy data set with
        ## average of each variable for each activity and each subject
        library(reshape2)
        melted <- melt(dat2,id=c("Subject","Activity"))
        tidy <- dcast(melted,Activity + Subject ~ variable, mean)
        file.create("TidyDataCoursera.txt")
        write.table(tidy,file="TidyDataCoursera.txt",row.names=FALSE)
}
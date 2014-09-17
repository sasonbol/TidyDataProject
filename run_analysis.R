## the first part of the script Merges the training and the test sets to create 
##one data set:

#read test dataset
      xtest<- read.table("UCI HAR Dataset/test/X_test.txt")
      ncol(xtest) 
# the number obtained is the number of fetures
      nrow(xtest)
#elements in ytest represent different activities (each assigned to a number from 1 to 6)
      class(ytest[,1])
      ytest
      ytest<- read.table("UCI HAR Dataset/test/y_test.txt")
      ncol(ytest)
      nrow(ytest)
      test.ids<- read.table("UCI HAR Dataset/test/subject_test.txt")
      nrow(test.ids)
      ncol(test.ids)
      head(test.ids, n=20)
      tail(test.ids, n=20)
#the subject id and the activity data frames shall then be combined with the xytest data frame
      sxytest<-cbind(test.ids, ytest, xtest)
#the next 4 commands are to ensure correct binding
      ncol(sxytest)
      nrow(sxytest)
      head(sxytest, n=3)
      tail(sxytest, n=3)
# the same steps are to be done with the train dataset
#read train dataset
      xtrain<- read.table("UCI HAR Dataset/train/X_train.txt")
      ncol(xtrain) 
# the number obtained is the number of feutures
      nrow(xtrain)
      ytrain<- read.table("UCI HAR Dataset/train/y_train.txt")
      ncol(ytrain)
      nrow(ytrain)
      train.ids<- read.table("UCI HAR Dataset/train/subject_train.txt")
      nrow(train.ids)
      ncol(train.ids)
      head(train.ids, n=20)
      tail(train.ids, n=20)

#the subject id shall then be combined with the xtest and ytest dataframe
      sxytrain<-cbind(train.ids, ytrain, xtrain)
#the next 4 commands are to ensure correct binding
      ncol(sxytrain)
      nrow(sxytrain)
      head(sxytrain, n=3)
      tail(sxytrain, n=3)
#now , I shall combine the test and train datasets together
      combined<- rbind(sxytest, sxytrain)
# to ensure that combination is fine
      nrow(combined)
      ncol(combined)
      head(combined, n=3)
      tail(combined, n=3)
      
##The second part of the script extracts only the measurements on the mean and 
##standard deviation for each measurement
      f<-read.table("UCI HAR Dataset/features.txt")
      f
      ncol(f)
      fvect<- f[,2]
      fvect
      class(fvect) 
# the fvect appears as a factor, so it should be converted to a vector of characters
      fvect<-as.character(fvect)
      class(fvect) # to ensure that the class is "character"
# for determination of the header names in the combined data frame:
      COLNAMES<-colnames(combined)<- c("subjectId", "activity", fvect)
      head(combined, n=2)
#to subset the dataset with the mean value columns, I extracted columns which have
#the word "mean" or "Mean" in their column names:
      mean.df<- combined[grep("[Mm]ean", COLNAMES )]
      head(mean.df, n=2)
      nrow(mean.df)
      ncol(mean.df)
#to subset the dataset with the standard deviation value columns, I extracted 
#columns which have the word "std" in their column names:
      SD.df<- combined[grep("std", COLNAMES )]
      head(SD.df, n=2)
      nrow(SD.df)
      ncol(SD.df)
#now to form a combined data frame for all means and standard deviation values:
      mean.SD.df<- cbind(combined[,1:2], mean.df, SD.df)
      ncol(mean.SD.df) 
      head(mean.SD.df, n=2)
#as, some of the columns (49:55) are actually angles of the mean values, thus
#they were removed from the data frame as they are not actually mean values
      mean.SD.df<-mean.SD.df[,-(49:55)]
      ncol(mean.SD.df) # now I have 81 columns instead of 88
      names(mean.SD.df) # to ensure that no angle vlues are still there

# in the third part of the script, I used descriptive activity names to name the
#activities in the data set
      class(mean.SD.df$activity)
      mean.SD.df$activity<- as.character(mean.SD.df$activity)
      class(mean.SD.df$activity) # to make sure that it was converted into character
#convert all numbers to their corresponding activity
      mean.SD.df$activity[mean.SD.df$activity == "1"] <- "walking"
      mean.SD.df$activity[mean.SD.df$activity == "2"] <- "walkingupstairs"
      mean.SD.df$activity[mean.SD.df$activity == "3"] <- "walkingdownstairs"
      mean.SD.df$activity[mean.SD.df$activity == "4"] <- "sitting"
      mean.SD.df$activity[mean.SD.df$activity == "5"] <- "standing"
      mean.SD.df$activity[mean.SD.df$activity == "6"] <- "lying"
#the next 2 commands are to make sure that the conversion went correctly
      mean.SD.df$activity[1:10]
      mean.SD.df$activity[40:50]
      
# In the forth part of the script, intstead of fixing the column names(variable names), 
#I changed them in a way to be more discriptive as discussed in the code book:
      m.s.names<- colnames(mean.SD.df)
      m.s.names
      m.s.names<-( c("subjectId", "activity", "tAcclBodyX.mean", "tAcclBodyY.mean", 
               "tAcclBodyZ.mean", "tAcclGravityX.mean","tAcclGravityY.mean",                    
               "tAcclGravityZ.mean", "tAcclBodyJerkX.mean", "tAcclBodyJerkY.mean",                  
               "tAcclBodyJerkZ.mean","tGyroBodyX.mean","tGyroBodyY.mean",                      
               "tGyroBodyZ.mean","tGyroBodyJerkX.mean","tGyroBodyJerkY.mean",                 
               "tGyroBodyJerkZ.mean","tAcclBodyMag.mean","tAcclGravityMag.mean",                  
               "tAcclBodyJerkMag.mean","tGyroBodyMag.mean","tGyroBodyJerkMag.mean",               
               "fAcclBodyX.mean","fAcclBodyY.mean","fAcclBodyZ.mean",                       
               "fAcclBodyFreqX.mean","fAcclBodyFreqY.mean","fAcclBodyFreqZ.mean",                  
               "fAcclBodyJerkX.mean","fAcclBodyJerkY.mean", "fAcclBodyJerkZ.mean",                    
               "fAccBodyJerkFreqX.mean","fAccBodyJerkFreqY.mean","fAccBodyJerkFreqZ.mean",              
               "fGyroBodyX.mean","fGyroBodyY.mean","fGyroBodyZ.mean",                      
               "fGyroBodyFreqX.mean","fGyroBodyFreqY.mean","fGyroBodyFreqZ.mean",                 
               "fAcclBodyMag.mean","fAcclBodyMagFreq.mean","fAcclBodyJerkMag.mean",             
               "fAcclBodyJerkMagFreq.mean","fGyroBodyMag.mean","fGyroBodyMagFreq.mean",           
               "fGyroBodyJerkMag.mean","fGyroBodyJerkMagFreq.mean","tAcclBodyX.std",                       
               "tAcclBodyY.std","tAcclBodyZ.std","tAcclGravityX.std","tAcclGravityY.std",                    
               "tAcclGravityZ.std","tAcclBodyJerkX.std","tAcclBodyJerkY.std","tAcclBodyJerkZ.std",                   
               "tGyroBodyX.std","tGyroBodyY.std","tGyroBodyZ.std","tGyroBodyJerkX.std",                  
               "tGyroBodyJerkY.std","tGyroBodyJerkZ.std","tAcclBodyMag.std","tAcclGravityMag.std",                  
               "tAcclBodyJerkMag.std","tGyroBodyMag.std","tGyroBodyJerkMag.std",                 
               "fAcclBodyX.std","fAcclBodyY.std","fAcclBodyZ.std","fAcclBodyJerkX.std",                    
               "fAcclBodyJerkY.std","fAcclBodyJerkZ.std","fGyroBodyX.std","fGyroBodyY.std",                       
               "fGyroBodyZ.std","fAcclBodyMag.std","fAcclBodyJerkMag.std",             "fGyroBodyMag.std",                 
               "fGyroBodyJerkMag.std" ))
      m.s.names
      colnames(mean.SD.df)<-m.s.names
      head(mean.SD.df, n=2)
      
# in the fifth part of the script, mean.df data frame was produced:
#each subject has the mean of each variable during the 6 different activities
#first load the plyr and dplyr packages
      library(plyr); library(dplyr)
# I used the ddply() function to get the mean of each column for each activity 
#(6 activities) done by each subject (3o individuals).
      tidy.df<- ddply(mean.SD.df, c("subjectId", "activity"), .fun= numcolwise(mean))
#to check the results
      head(tidy.df, n=10)
      nrow(tidy.df) 
# this should be (30*6) = 180
      ncol(tidy.df) 
#this should be the same number of columns in the meanSD.df data frame
#final step is to write the data frame out
      write.table(tidy.df,"tidydf.txt", row.names= FALSE)
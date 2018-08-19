

#gets the data, creates a folder, saves and unzippes it.
URL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
ZIP <- "./getdata-projectfiles-UCI-HAR-Dataset.zip"
FILE <- "./UCI HAR Dataset"
TIDYDATA <- "./tidy-UCI-HAR-dataset.txt"
AVERIGE_DATA <- "./tidy_averige.txt"
  if (file.exists(ZIP) == FALSE) {
      download.file(URL, destfile = ZIP)
    }
  # Uncompress data file
  if (file.exists(FILE) == FALSE) {
    unzip(ZIP)
  }

#Reading the test-files:
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

#Reading the train-files:
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

#Reading subject-files:
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)


#Combining data by rows into one dataset:
x <- rbind(x_train, X_test)
  y <- rbind(y_train, y_test)
  s <- rbind(subject_train, subject_test)

#Features are vectors, that are obtained by calculating variables in the sensor signals (accelometer and gyroscope). Mean (mean ()) and standard deviation (std()) are features and they are extracted:

  features <- read.table("./UCI HAR Dataset/features.txt")
# Names two columns in the features.txt Search for matches to argument mean (mean) or standard deviation (std) 

  names(features) <- c('feat_id', 'feat_name')
  index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
  x <- x[, index_features] 
# Replaces all matches of a string features 
  names(x) <- gsub("\\(|\\)", "", (features[index_features, 2]))


# Read activity names
  activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
# Name activities
  names(activities) <- c('act_id', 'act_name')
  y[, 1] = activities[y[, 1], 2]

  names(y) <- "Activity"
  names(s) <- "Subject"

# Combines data table by columns
  tidyDataSet <- cbind(s, y, x)

  p <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
  tidyDataAVGSet <- aggregate(p,list(tidyDataSet$Subject, tidyDataSet$Activity), mean)
  
# Activity and Subject name of columns 
  names(tidyDataAVGSet)[1] <- "Subject"
  names(tidyDataAVGSet)[2] <- "Activity"# Created csv (tidy data set) in diretory

# Created csv (tidy data set) in diretory
  write.table(tidyDataSet, TIDYDATA)
  # Created csv (tidy data set AVG) in diretory
  # write.csv(tidyDataAVGSet, TIDYDATAAVG)
  # Created txt (tidy data set AVG) in diretory
  write.table(tidyDataAVGSet, AVERIGE_DATA)


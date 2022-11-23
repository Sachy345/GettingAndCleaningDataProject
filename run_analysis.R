library(dplyr)

##Reading in all data
features <- read.table("features.txt", col.names = c("N", "Feature"))
activity <- read.table("activity_labels.txt", col.names = c("ID", "Activity"))

test_x <- read.table("X_test.txt", col.names = features$Feature)
test_y <- read.table("y_test.txt", col.names = "Activity")
subject_test <- read.table("subject_test.txt", col.names = "Volunteer")

train_x <- read.table("X_train.txt", col.names = features$Feature)
train_y <- read.table("y_train.txt", col.names = "Activity")
subject_train <- read.table("subject_train.txt", col.names = "Volunteer")

##Merging training and test sets into one data set
X <- rbind(test_x, train_x)
Y <- rbind(test_y, train_y)
volunteer <- rbind(subject_test, subject_train)
data_set <- cbind(volunteer, Y, X)

##Extracting mean and std for each measurement
data_set2 <- data_set %>%
    select(Volunteer, Activity, contains(c("mean", "std")))

##Adding Activity Names to Activity Column 
data_set2 <- data_set2 %>%
  left_join(activity, by = c("Activity" = "ID")) %>% 
  select(-Activity) %>% 
  rename(Activity = Activity.y) %>% 
  select(Volunteer, Activity, everything())


##Cleaning up Column Names
names(data_set2) <- gsub("^t", "Time", names(data_set2))
names(data_set2) <- gsub("\\.t", "Time", names(data_set2))
names(data_set2) <- gsub("^f", "Frequency", names(data_set2))
names(data_set2) <- gsub("Acc", "Accelerometer", names(data_set2))
names(data_set2) <- gsub("Gyro", "Gyroscope", names(data_set2))
names(data_set2) <- gsub(".mean()", "Mean", names(data_set2))
names(data_set2) <- gsub(".std()", "STD", names(data_set2))
names(data_set2) <- gsub("mag", "Magnitude", names(data_set2), ignore.case = TRUE)
names(data_set2) <- gsub("angle", "Angle", names(data_set2))
names(data_set2) <- gsub("gravity", "Gravity", names(data_set2))
names(data_set2) <- gsub("BodyBody", "Body", names(data_set2))
names(data_set2) <- gsub("\\.+", "", names(data_set2))


##Tidy Data.  This data set shows the average of each variable for activity
##and each subject. 
tidy_data <- data_set2 %>%
  group_by(Volunteer, Activity) %>% 
  summarise_all(mean)
    
##Making tidy data into a text file
write.table(tidy_data, file = "tidy_data.txt")

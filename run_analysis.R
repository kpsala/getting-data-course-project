## Course project
#

library(tidyverse)

# set data paths
testPath <- "./UCI HAR Dataset/test"
trainPath <- "./UCI HAR Dataset/train"

# read in variable information

varNames <- read.table(file = "./UCI HAR Dataset/features.txt") %>%
  pull(2)

activityLabels <- read.table(file = "./UCI HAR Dataset/activity_labels.txt")
names(activityLabels) <- c("activityID", "activity")

# read in Train data and combine

train_subject <- read.table(file = paste0(trainPath, "./subject_train.txt"))
train_x <- read.table(file = paste0(trainPath, "./X_train.txt"))
train_y <- read.table(file = paste0(trainPath, "./Y_train.txt"))

names(train_y) <- "activityID"
names(train_subject) <- "subjectID"
names(train_x) <- varNames

train <- bind_cols(train_subject, train_y) %>%
  left_join(activityLabels, by = "activityID") %>%
  mutate(dataset = "train") %>%
  bind_cols(train_x)

# read in Test data and combine

test_subject <- read.table(file = paste0(testPath, "./subject_test.txt"))
test_x <- read.table(file = paste0(testPath, "./X_test.txt"))
test_y <- read.table(file = paste0(testPath, "./Y_test.txt"))

names(test_y) <- "activityID"
names(test_subject) <- "subjectID"
names(test_x) <- varNames

test <- bind_cols(test_subject, test_y) %>%
  left_join(activityLabels, by = "activityID") %>%
  mutate(dataset = "test") %>%
  bind_cols(test_x)

# combine datasets

df <- bind_rows(train, test)

# pivot and filter

df.pivot <- df %>%
  pivot_longer(cols = -c(subjectID, activityID, activity, dataset),
               names_to = "feature",
               values_to = "value")

df.filter <- df.pivot %>%
  filter(str_detect(feature, "mean") | str_detect(feature, "std")) %>%
  filter(!str_detect(feature, "meanFreq"))


# group and process, then output

df.grouped <- df.filter %>%
  group_by(subjectID, activity, feature) %>%
  summarize(mean = mean(value),
            std = sd(value))

write_csv(df.grouped, "./tidy data output.csv")

write.table(df.grouped, file="./tidy data output.txt", row.name=FALSE)

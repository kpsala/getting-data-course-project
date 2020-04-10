#codebook

## Tidy data from `run_analysis.R`

The tidy, long-format data set created by `run_analysis.R` takes the following structure. For definitions of the features, readers are directed to the original datasets readme which is attached in this repo

```
> head(df.filter)
# A tibble: 6 x 6
  subjectID activityID activity dataset feature             value
      <int>      <int> <fct>    <chr>   <chr>               <dbl>
1         1          5 STANDING train   tBodyAcc-mean()-X  0.289 
2         1          5 STANDING train   tBodyAcc-mean()-Y -0.0203
3         1          5 STANDING train   tBodyAcc-mean()-Z -0.133 
4         1          5 STANDING train   tBodyAcc-std()-X  -0.995 
5         1          5 STANDING train   tBodyAcc-std()-Y  -0.983 
6         1          5 STANDING train   tBodyAcc-std()-Z  -0.914 
```

Column descriptions:
subjectID - The indentifier of the subject who carried out the experiment (from subject_train.txt)

activityID - The numeric coding of the activity

activity - The activity label (from activity_labels.txt)

dataset - To indicate which data set (train or test) the data originated

feature - The feature (measurement)

value - The value of feature


## Tidy, averaged data set


The new data frame created from step 5 is a tidy data set with the average of each varible for each activity.


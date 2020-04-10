#codebook

## Tidy data from `run_analysis.R`

The tidy, long-format data set created by `run_analysis.R` takes the following structure. For definitions of the features, readers are directed to the original datasets codebook (README) which is attached in this repo.

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

```
> head(df.grouped)
# A tibble: 6 x 5
  subjectID activity feature             mean   std
      <int> <fct>    <chr>              <dbl> <dbl>
1         1 LAYING   fBodyAcc-mean()-X -0.939 0.104
2         1 LAYING   fBodyAcc-mean()-Y -0.867 0.270
3         1 LAYING   fBodyAcc-mean()-Z -0.883 0.200
4         1 LAYING   fBodyAcc-std()-X  -0.924 0.130
5         1 LAYING   fBodyAcc-std()-Y  -0.834 0.340
6         1 LAYING   fBodyAcc-std()-Z  -0.813 0.309
```

The column headings are the same as before. The data has been grouped according to ``dplyr::group_by(subjectID, activity, feature)`` and the mean and standard deviation are reported from the value column.


first of all, we read the dataset into R and merge train and test data as one dataset.
from the feature file we use Regular Expressions to extract the mean and std dataset so we now have two dataset, one for each.
now we have exactly one dataset for each variable, we can give each dataset header from the feature.
and then we can merge this two dataset into one dataset.
add the subject and activitycode into dataset and transform the activitycode into activity that have better explanation on what subject really does.
and then, we edit the header name and make it more readable.
by dplyr package we can group the data for each subject and each activity and for each group we can compute average of each variable.
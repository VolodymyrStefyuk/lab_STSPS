file1 <- "D:/lab/STSPS/semestr_1/for_lab4/UCI HAR Dataset/train/X_train.txt"
x_train<- read.table(file1)
x_test<- read.table(file1)
x <- rbind(x_train, x_test)
y_train<- read.table(file1)
y_test<- read.table(file1)
y <- rbind(y_train, y_test)
subject_train<- read.table(file1)
subject_test<- read.table(file1)
subject<- rbind(subject_train, subject_test)
features<- read.table(file1)
indices<- grep("mean()|std()", features[, 2])
x <- x[, indices]
activity<- read.table(file1)
y[,1] <- activity[y[, 1], 2]
names(x) <- features[indices, 2]
names(y) <- "activity"
names(subject) <- "subject"
result<- cbind(subject, y, x)
subject_len<- length(table(subject))
activity_len<- length(activity[, 1])
cols<- dim(result)[2]
result_avg<- result[1:(subject_len*activity_len), ]
row<- 1
for(i in 1:subject_len) {
for(j in 1:activity_len) {
result_avg[row, 1] <- unique(subject)[, 1][i]
result_avg[row, 2] <- activity[j, 2]
tmp<- result[result$subject == i &result$activity == activity[j, 2], ]
result_avg[row, 3:cols] <- colMeans(tmp[, 3:cols])
row<- row + 1
  }
}

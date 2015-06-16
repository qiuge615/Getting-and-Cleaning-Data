library(data.table)

#process data
features <- read.table("features.txt")[2]
activity_labels <- read.table("activity_labels.txt")[2]
mean_std <- grep("mean|std",features$V2)

#process train data
x_train <- read.table("train/X_train.txt")
names(x_train) <- features$V2

y_train <- read.table("train/y_train.txt")
names(y_train) <- "labels"

subject_train <- read.table("train/subject_train.txt")
names(subject_train) <- "subjects"

#process test data
x_test <- read.table("test/X_test.txt")
names(x_test) <- features$V2

y_test <- read.table("test/y_test.txt")
names(y_test) <- "labels"

subject_test <- read.table("test/subject_test.txt")
names(subject_test) <- "subjects"

x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)
subject_merge <- rbind(subject_train, subject_test)

x_data <- x_merge[, mean_std]
colnames(x_data) <- features$V2[mean_std]

labels <- activity_labels$V2[y_merge[,]]

data <- cbind(subject_merge,labels,x_data)
colnames(data)<-c("subject","labels",colnames(x_data))

dt <- data.table(data)
tidy <- dt[,lapply(.SD,mean),by=list(subject,labels)]
write.table(tidy, file="tidy_data.txt", row.name=FALSE)

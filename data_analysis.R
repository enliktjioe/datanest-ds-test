library(dplyr)
library(sqldf)
library(data.table)

## Read data
AWS_Payment_201805 <- fread("./data_AWS/AWS_Payment_201805.csv")
AWS_Payment_201806 <- fread("./data_AWS/AWS_Payment_201806.csv")
AWS_Payment_201807 <- fread("./data_AWS/AWS_Payment_201807.csv")
AWS_Payment_201808 <- fread("./data_AWS/AWS_Payment_201808.csv")
AWS_Payment_201809 <- fread("./data_AWS/AWS_Payment_201809.csv")
AWS_Payment_201810 <- fread("./data_AWS/AWS_Payment_201810.csv")

##############################################################################################################################
##
##############################################################################################################################

## Merge all 6 AWS Payment datasets
Merged_AWS_Payment <- rbind(AWS_Payment_201805, AWS_Payment_201806, AWS_Payment_201807,
                      AWS_Payment_201808,AWS_Payment_201809, AWS_Payment_201810)

# remove individual data frames to save memory
rm(AWS_Payment_201805, AWS_Payment_201806, AWS_Payment_201807,
    AWS_Payment_201808, AWS_Payment_201809, AWS_Payment_201810)

##############################################################################################################################
##
##############################################################################################################################

str(Merged_AWS_Payment)
dim(Merged_AWS_Payment[InvoiceID == "136209072"])

## Extract only the measurements
# # determine columns of data set to keep based on column name
# columnsToKeep <- grepl("InvoiceID|PayerAccountId|LinkedAccountId", colnames(AWSPayment))
# 
# # keep data in these columns only
# AWSPayment <- AWSPayment[, columnsToKeep]

##############################################################################################################################
##
##############################################################################################################################

## From the data set above, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
AWS_Payment_data_analysis <- Merged_AWS_Payment
write.csv(AWS_Payment_data_analysis, "AWSPayment_data_analysis.csv")



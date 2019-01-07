library(dplyr)
library(sqldf)

## Read data
df_AWS_Payment_201805 <- read.csv("./data_AWS/AWS_Payment_201805.csv")
df_AWS_Payment_201806 <- read.csv("./data_AWS/AWS_Payment_201806.csv")
df_AWS_Payment_201807 <- read.csv("./data_AWS/AWS_Payment_201807.csv")
df_AWS_Payment_201808 <- read.csv("./data_AWS/AWS_Payment_201808.csv")
df_AWS_Payment_201809 <- read.csv("./data_AWS/AWS_Payment_201809.csv")
df_AWS_Payment_201810 <- read.csv("./data_AWS/AWS_Payment_201810.csv")

##############################################################################################################################
##
##############################################################################################################################

## Merge all 6 AWS Payment datasets
AWSPayment <- rbind(df_AWS_Payment_201805, df_AWS_Payment_201806, df_AWS_Payment_201807,
                      df_AWS_Payment_201808, df_AWS_Payment_201809, df_AWS_Payment_201810)


# remove individual data frames to save memory
rm(df_AWS_Payment_201805, df_AWS_Payment_201806, df_AWS_Payment_201807,
    df_AWS_Payment_201808, df_AWS_Payment_201809, df_AWS_Payment_201810)

##############################################################################################################################
##
##############################################################################################################################

## Extract only the measurements

# determine columns of data set to keep based on column name
columnsToKeep <- grepl("InvoiceID|PayerAccountId|LinkedAccountId", colnames(AWSPayment))

# keep data in these columns only
AWSPayment <- AWSPayment[, columnsToKeep]

##############################################################################################################################
##
##############################################################################################################################

## From the data set above, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
AWSPayment_data_analysis <- AWSPayment
write.csv(AWSPayment_data_analysis, "AWSPayment_data_analysis.csv")



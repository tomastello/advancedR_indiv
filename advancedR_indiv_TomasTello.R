source('scripts/load_libraries.R')

raw_data_train <-fread('data/house_price_train.csv', stringsAsFactors = F)
raw_data_test <-fread('data/house_price_test.csv', stringsAsFactors = F)

str(raw_data_train)


##### Data cleaning ######

raw_data_train$date <- as.Date(raw_data_train$date, "%m/%d/%Y")
raw_data_train$zipcode <- as.factor(raw_data_train$zipcode)

raw_data_train[ , names(raw_data_train)[sapply(raw_data_train, is.integer)]:=
             lapply(.SD,as.numeric)]

str(raw_data_train)

##### Feature Engineering ######